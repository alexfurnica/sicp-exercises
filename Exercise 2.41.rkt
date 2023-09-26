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

(define (unique-triples n)
  (flatmap
   (lambda (i)
     (flatmap (lambda (j)
            (map
             (lambda (k) (list k j i))
             (enumerate (- j 1))))
          (enumerate (- i 1))))
   (enumerate n)))

(define (sum-to-target? lst target)
  (= (+ (car lst) (cadr lst) (caddr lst)) target))

(define (make-pair-sum n s)
  (filter
   (lambda (i)
     (sum-to-target? i s))
   (unique-triples n)))

(make-pair-sum 10 15)