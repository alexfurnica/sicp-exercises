#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; Old version
(define (count-leaves-old x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

;; Update with generic sequence ops
(define (count-leaves tree)
  (accumulate
   +
   0
   (map
    (lambda (node)
      (cond ((pair? node) (count-leaves node))
            ((null? node) 0)
            (else 1)))
    tree)))

(count-leaves (list 1 (list (list 2) (list 3)) 4))
(count-leaves '())