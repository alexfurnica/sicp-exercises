#lang racket
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (midpoint-segment segment)
  (make-point
   (/ (+ (x-point (start-segment segment))
         (x-point (end-segment segment)))
      2)
   (/ (+ (y-point (start-segment segment))
         (y-point (end-segment segment)))
      2)))

(define test-segment
  (make-segment
   (make-point 2 3)
   (make-point 5 6)))

(define test-segment2
  (make-segment
   (make-point 0 0)
   (make-point 4 4)))

(print-point (midpoint-segment test-segment))
(print-point (midpoint-segment test-segment2))