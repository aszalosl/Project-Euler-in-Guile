;; Problem #7
;; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
;; we can see that the 6th prime is 13.
;; What is the 10001st prime number?


(define (e007 n) ; nth-prime
  (define (prime-test candidate primes index)
    (if (= 0 (vector-ref primes index))
      (vector-set! primes index candidate) ; if prime, store
      (if (< 0 (remainder candidate (vector-ref primes index)))
        (prime-test candidate primes (1+ index)))))

; primes contains all the primes are less than candidate
  (define primes (make-vector (1+ n) 0))
  (vector-set! primes 0 2)
  
  (do [(candidate 3 (+ 2 candidate))]
       [(positive? (vector-ref primes n))]
       (prime-test candidate primes 1))
  (vector-ref primes (1- n)))

;(e007 6)
(display (e007 10001)) ; => 104743

