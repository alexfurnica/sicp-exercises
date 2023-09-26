#lang racket

(define (double num)
  (+ num num))

(define (halve num)
  (/ num 2))

(define (fast-mul-iter a b c)
  (cond ((= b 0)
         c)
        ((= (remainder b 2) 0)
         (fast-mul-iter (double a) (halve b) c))
        (else
         (fast-mul-iter a (- b 1) (+ c a)))))

(fast-mul-iter 6 7 0)