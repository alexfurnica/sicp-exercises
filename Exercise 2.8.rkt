#lang racket
(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

;; lower bound needs to be smallest possible i.e. (upper-bound x) - (lower-bound y)
(define (sub-interval interval1 interval2)
  (make-interval
   (- (lower-bound interval1) (upper-bound interval2))
   (- (upper-bound interval1) (lower-bound interval2))))

(define interval1 (make-interval 1 2))
(define interval2 (make-interval 5 10))

(sub-interval interval2 interval1)