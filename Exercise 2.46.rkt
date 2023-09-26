#lang racket

(define (make-vect x y)
  (list x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cadr v))

(define (add-vect v1 v2)
  (make-vect
   (+ (xcor-vect v1) (xcor-vect v2))
   (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect
   (- (xcor-vect v1) (xcor-vect v2))
   (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect v s)
  (make-vect
   (* s (xcor-vect v))
   (* s (ycor-vect v))))

(define v (make-vect 3 1))
(define v2 (make-vect 4 6))

(xcor-vect v)
(ycor-vect v)

(add-vect v v2)
(sub-vect v v2)
(scale-vect v 3)