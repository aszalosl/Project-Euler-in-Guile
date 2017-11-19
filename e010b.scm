;; Problem #10
; Sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
; Find the sum of all the primes below two million.

(add-to-load-path ".")
(use-modules (euler-module)) ; odd-prime?

(define (e010b limit)

  (define (loop candidate sum)
    (if (> candidate limit)
      sum
      (if (odd-prime? candidate)
        (loop (+ candidate 2) (+ sum candidate))
        (loop (+ candidate 2) sum))))
  (loop 3 2))
;(e010b 10)
(display (e010b 2000000))   ; running time 4.87
