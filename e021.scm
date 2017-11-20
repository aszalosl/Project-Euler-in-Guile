;; Problem #21
; Let d(n) be defined as the sum of proper divisors of n 
; (numbers less than n which divide evenly into n).
; If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair 
; and each of a and b are called amicable numbers.
; For example, the proper divisors of 220 are 
; 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. 
; The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
; Evaluate the sum of all the amicable numbers under 10000.

(add-to-load-path ".")
(use-modules (euler-module)) ; sum-of-divisors, group-factors, factor

(define (sum-real-divisors n)
  (- (sum-of-divisors (group-factors (factors n))) n))
(define (sum-amicable number sum limit)
  (if (> number limit)
    sum
    (let [(srd (sum-real-divisors number))]
      (if (and (< 1 srd) (not (= srd number)) 
             (= (sum-real-divisors srd) number))
      (sum-amicable (1+ number) (+ sum number) limit)
      (sum-amicable (1+ number) sum limit)))))

(define (e021)
  (sum-amicable 20 0 10000))
(display (e021))

