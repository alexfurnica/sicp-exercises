#lang racket

(define (double num)
  (+ num num))

(define (halve num)
  (/ num 2))

(define (fast-mul a b)
  (cond ((= b 1) a)
        ((= (remainder b 2) 0)
         (fast-mul (double a) (halve b)))
        (else
         (+ a (fast-mul a (- b 1))))))

(fast-mul 3 3)