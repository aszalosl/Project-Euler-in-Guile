;; Problem #9
; A Pythagorean triplet is a set of three natural numbers, 
; a < b < c, for which, a^2 + b^2 = c^2
; For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
; There exists exactly one Pythagorean triplet for which 
; a + b + c = 1000. Find the product abc.

(define (e009)
  (define (loop m)
    (if (zero? (remainder 500 m))
      (let ((n+m (quotient 500 m)))
        (if (< (- n+m m) m)
          (cons m (- n+m m))
          (loop (1+ m))))
      (loop (1+ m))))

  (let* ((pair (loop 1))
        (m (car pair))
        (n (cdr pair))
        (a (- (* m m) (* n n)))
        (c (+ (* m m) (* n n)))
        (b (* 2 m n)))
    (* a b c)))    

(display (e009))

