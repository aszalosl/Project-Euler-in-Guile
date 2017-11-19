;; Problem #1
;; If we list all the natural numbers below 10 that are multiples of 3 or 5,
;; we get 3, 5, 6 and 9. The sum of these multiples is 23.
;; Find the sum of all the multiples of 3 or 5 below 1000.

(define (e001 number)
  (define (total number sum)
    (if (= 0 number)
      sum
      (if (or (= 0 (remainder number 5)) (= 0 (remainder number 3)))
        (total (1- number) (+ sum number))
        (total (1- number) sum))))
  (total (1- number) 0))

;(e001 10)
(display (e001 1000))
