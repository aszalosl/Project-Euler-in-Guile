;; Problem #10
; Sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
; Find the sum of all the primes below two million.

(define (e010 limit)
  (define (next n i primes limit)
    ; search for the next prime number
    (if (zero? (vector-ref primes i)) ; missing prime
      (begin 
        (vector-set! primes i n) ; store the next prime
        (if (< (+ n 2) limit)
          (next (+ n 2) 1 primes limit)))
      (if (zero? (remainder n (vector-ref primes i))) ; has divisor
        (if (> limit (+ n 2))
          (next (+ n 2) 1 primes limit)) ; try the next odd number
        (next n (1+ i) primes limit))))   ; search for a divisor

  (define (total i sum primes)
    ; total the numbers in vector primes
    (let ((p_i (vector-ref primes i)))
      (if (zero? p_i)
        sum
        (total (1+ i) (+ sum p_i) primes))))
  
  (let ((primes (make-vector 200000 0)))
    (vector-set! primes 0 2)
    (vector-set! primes 1 3)
    (vector-set! primes 2 5)
    (next 7 1 primes limit)
    (total 0 0 primes)))

(display (e010 2000000)) ; running time 12:57.51

