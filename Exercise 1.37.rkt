#lang sicp

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

(cont-frac-recursive (lambda (i) 1.0)
           (lambda (i)  1.0)
           100)

(cont-frac-iterative (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)