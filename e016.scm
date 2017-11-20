;; Problem #16
;; 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
;; What is the sum of the digits of the number 2^1000?
(define (sum-digits n s)
  (if (zero? n)
    s
    (sum-digits (quotient n 10) (+ s (remainder n 10)))))

(define (e016)
  (sum-digits (expt 2 1000) 0))
(display (e016))

