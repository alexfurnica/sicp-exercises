#lang racket

; This is a recursive version
(define (cont-frac-recursive n d k)
  
  (define (try i)
    (if (= i k)
        0
        (/
         (n i)
         (+ (d i) (try (+ i 1))))))
  
  (try 1))

; This is an iterative version
(define (cont-frac-iterative n d k)

  (define (cont-frac-iter i acc)
    (if (= i 0)
        acc
        (cont-frac-iter
         (- i 1)
         (/ (n i) (+ (d i) acc)))))

  (cont-frac-iter k 0))

(define (new-d lst)
  (define (calc-new-num l)
    (if (not (= (list-ref l 0) 1))
        (let ((new-num  (foldl + 0 l)))
          (append (list-tail l 1) new-num))
        (append (list-tail l 1) 1)))
  (cond
    ((empty? lst) 1)
    ((= (length lst) 1) 2)
    ((= (length lst) 2) 1)
    (else (calc-new-num lst))))

(define (d-euler i)
  (if (= (modulo i 3) 2)
      (* (+ (quotient i 3) 1) 2)
      1))

(cont-frac-iterative
 (lambda (i) 1.0)
 d-euler
 100)