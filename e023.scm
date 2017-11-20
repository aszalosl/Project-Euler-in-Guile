;; Problem #23
; A number n is called deficient if the sum of its proper divisors is less
; than n and it is called abundant if this sum exceeds n.
; Find the sum of all the positive integers which cannot be written
; as the sum of two abundant numbers.

(add-to-load-path ".")
(use-modules (euler-module) ; sum-of-divisors, group-factors, factor
             (srfi srfi-42)) ; list-comprehension

(define (abundant? n)
  (let [(nod (sum-of-divisors (group-factors (factors n))))]
    (> nod (* 2 n))))
(define *limit* 28125)
(define abundant-numbers 
  (list-ec (:range i 12 *limit*) (if (abundant? i)) i))

(define non-abundant-numbers
  (vector-ec (:range i 0 (1+ *limit*)) i))

(define (inner rev forward)
  (if (not (null? forward))
    (let [(sum (+ rev (car forward)))]
      (if  (< sum *limit*)
        (begin 
          (vector-set! non-abundant-numbers sum 0)
          (inner rev (cdr forward)))))))
(define (outer srebmun forward)
  (if (not (null? srebmun))
    (begin
      (inner (car srebmun) forward)
      (outer (cdr srebmun) forward))))
(outer (reverse abundant-numbers) abundant-numbers)

(define (e023)
     (outer (reverse abundant-numbers) abundant-numbers)
     (apply + (array->list non-abundant-numbers)))
(display (- (e023) *limit*))
