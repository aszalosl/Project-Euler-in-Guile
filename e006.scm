;; Problem #6
;; The sum of the squares of the first ten natural numbers is, 
;; 1^2 + 2^2 + ... + 10^2 = 385
;; The square of the sum of the first ten natural numbers is,
;; (1 + 2 + ... + 10)^2 = 55^2 = 3025
;; Hence the difference between the sum of the squares of the first ten 
;; natural numbers and the square of the sum is 3025 − 385 = 2640.
;; Find the difference between the sum of the squares of the first 
;; one hundred natural numbers and the square of the sum.

(use-modules (srfi srfi-42))  ; list comprehension
(define (square x) (* x x))

(define (sum-squares n)
  (apply + (map square (list-ec (:range i 1 (1+ n)) i))))

(define (square-sum n)
  (square (apply + (list-ec (:range i 1 (1+ n)) i))))

(define (e006 n)
  (- (square-sum n) (sum-squares n)))
;(e006 10)
(display (e006 100))
