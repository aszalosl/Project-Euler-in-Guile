;; Problem #14
;;The following iterative sequence is defined for the set of positive integers:
;; n → n/2 (n is even)
;; n → 3n + 1 (n is odd)
;; Using the rule above and starting with 13, we generate the following sequence:
;; 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
;; It can be seen that this sequence (starting at 13 and finishing at 1) 
;; contains 10 terms. Although it has not been proved yet (Collatz Problem), 
;; it is thought that all starting numbers finish at 1.
;; Which starting number, under one million, produces the longest chain?

(define (collatz n c)
  (if (= 1 n)
    c
    (if (even? n)
      (collatz (quotient n 2) (1+ c))
      (collatz (1+ (* 3 n)) (1+ c)))))

; brute-force seach - just a loop
(define (brutec n ms mn)
  (if (> n 1e6)
    mn
    (let [(c (collatz n 1))]
      (if (> c ms)
        (brutec (1+ n) c n)
        (brutec (1+ n) ms mn)))))
(display (brutec 1 0 0))
;check (collatz 837799 1)


