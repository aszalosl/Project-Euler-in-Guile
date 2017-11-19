;; Problem #4
;; A palindromic number reads the same both ways. The largest palindrome made
;; from the product of two 2-digit numbers is 9009 = 91 × 99.
;; Find the largest palindrome made from the product of two 3-digit numbers.

(use-modules (srfi srfi-42)) ; for list comprehension
(define (palindrome? number)
  (let ((s (number->string number)))
    (equal? s (string-reverse s))))
(define (e004 interval-min interval-max)
  (apply max 
         (filter palindrome? 
                 (list-ec (:range i interval-min interval-max) 
                          (:range j i interval-max) 
                          (* i j)))))
;(e004 10 100) 
(display (e004 100 1000))
