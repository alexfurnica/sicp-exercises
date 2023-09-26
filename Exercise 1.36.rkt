#lang sicp

(define tolerance 0.0001)

(define (close-enough? a b)
  (< (abs (- a b)) tolerance))

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display guess)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (fixed-point-avg-damp f first-guess)
  (define (avg-damp f input)
    (/ (+ input (f input)) 2))
  (define (try guess)
    (let ((next (f (avg-damp f guess))))
      (newline)
      (display guess)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)
(newline)
(fixed-point-avg-damp (lambda (x) (/ (log 1000) (log x))) 2)