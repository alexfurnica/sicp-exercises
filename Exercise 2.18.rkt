#lang racket

(define (reverse lst)
  (define (reverse-iter lst1 lst2)
    (if (empty? lst1)
        lst2
        (reverse-iter
         (cdr lst1)
         (cons (car lst1) lst2))))
  (reverse-iter lst '()))

(reverse (list 1 4 9 16 25))