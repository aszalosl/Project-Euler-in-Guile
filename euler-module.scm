(define-module (euler-module)
  #: export (factors
             group-factors
             number-of-divisors
             sum-of-divisors
             odd-prime?))


;; prime factors of a natural number in decreasing order
(define (factors number)
  (define (factors' number divisor factor-list)
    (if (= 1 number)
      factor-list
      (if (= 0 (remainder number divisor))
        (factors' (/ number divisor) divisor (cons divisor factor-list))
        (factors' number (1+ divisor) factor-list))))
  (factors' number 2 '()))

; from the list of the factors create a list of pairs factor(base)-exponent
(define (group-factors factor-list)
  (define (group-factors' factor-list counter)
    (if (null? (cdr factor-list))
      (list (cons (car factor-list) counter))
      (if (= (car factor-list) (cadr factor-list))
        (group-factors' (cdr factor-list) (1+ counter))
        (cons (cons (car factor-list) counter)
              (group-factors' (cdr factor-list) 1)))))
  (group-factors' factor-list 1))

(define (number-of-divisors factor-group)
  (define (nod factor-group counter)
    (if (null? factor-group)
      counter
      (nod (cdr factor-group) 
           (* (1+ (cdar factor-group)) counter))))
  (nod factor-group 1))

(define (sum-of-divisors factor-group)
  (define (sod factor-group product)
    (if (null? factor-group)
      product
      (let [(pi (caar factor-group))
            (ki (cdar factor-group))]
        (* (sod (cdr factor-group)
                (/ (1- (expt pi (1+ ki)))
                   (1- pi)))
           product))))
    (sod factor-group 1))


; it is a prime, bigger than 2?
(define (odd-prime? number)
  (define (prime? candidate divisor) ; prime-test
    (if (> (* divisor divisor) candidate)
      #t
      (if (zero? (remainder candidate divisor))
        #f
        (prime? candidate (+ divisor 2)))))
  (prime? number 3))
