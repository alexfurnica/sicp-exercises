#lang racket

(define (make-interval a b) (cons a b))
(define (upper-bound interval)
  (max (car interval) (cdr interval)))
(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define interval1 (make-interval 1 2))
(define interval2 (make-interval 4 3))

(lower-bound interval1)
(upper-bound interval1)
(lower-bound interval2)
(upper-bound interval2)