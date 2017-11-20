;; Problem #20
; Find the sum of the digits in the number 100!
(use-modules (srfi srfi-42)) 

(define (fact n) (product-ec (: i 2 (1+ n)) i)) 
(define (sum-digits n s)
  (if (zero? n)
    s
    (sum-digits (quotient n 10) (+ s (remainder n 10)))))

(define (e020)
  (sum-digits (fact 100) 0))
(display (e020))

