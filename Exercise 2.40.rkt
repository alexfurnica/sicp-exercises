#lang racket

(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate n)
  (define (recurse num)
    (if (= num (+ n 1))
        '()
        (cons num (recurse (+ num 1)))))
  (recurse 1))

(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
          (enumerate (- i 1))))
   (enumerate n)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

;; Using fermat test with default 100 tries
(define (prime?2 num)
  (define (try iter max-iter)
    (let ((guess (random 2 num)))
      (cond ((= iter max-iter)
             false)
            ((= (remainder (expt guess num) num)
                (remainder guess num))
             true)
            (else (try (+ iter 1) max-iter)))))
  (try 0 100))

;; Using divisor search (couldn't get Fermat to work :( )
(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))
  
(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

(prime-sum-pairs 10)