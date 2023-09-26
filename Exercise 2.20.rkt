#lang racket

; Initial version
(define (same-parity-old . nums)
  (define (iter-parity isodd lst remaining)
    (cond ((empty? remaining) lst)
          ((eq? isodd true)
           (let ((first (car remaining)))
             (if (odd? first)
                 (iter-parity
                  isodd
                  (append lst (list first))
                  (cdr remaining))
                 (iter-parity
                  isodd
                  lst
                  (cdr remaining)))))
          (else
           (let ((first (car remaining)))
             (if (even? first)
                 (iter-parity
                  isodd
                  (append lst (list first))
                  (cdr remaining))
                 (iter-parity
                  isodd
                  lst
                  (cdr remaining)))))))
  (iter-parity (odd? (car nums)) '() nums))

; Improved version
(define (same-parity . nums)
  (let ((yes? (if (odd? (car nums))
                  odd?
                  even?)))
    (define (same-parity-iter remaining result)
      (if (empty? remaining)
          (reverse result)
          (same-parity-iter (cdr remaining) (if (yes? (car remaining))
                                                (cons (car remaining) result)
                                                result))))
    (same-parity-iter (cdr nums) (list (car nums)))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7 8)