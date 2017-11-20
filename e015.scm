;; Problem #15
;; Starting in the top left corner of a 2×2 grid, and only being able to move 
;;to the right and down, there are exactly 6 routes to the bottom right corner.
;; How many such routes are there through a 20×20 grid?

; naive variant
;(define (fact n a) (if (zero? n) a (fact (1- n) (* a n))))

(use-modules (srfi srfi-42)) 
(define (fact n) (product-ec (: i 2 (1+ n)) i)) 

(define (e015)
  (/ (fact 40) (fact 20) (fact 20)))
(display (e015))
