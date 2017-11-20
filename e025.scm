;; Problem #25
; What is the index of the first term in the Fibonacci sequence
; to contain 1000 digits?

(define (e025 i fn fn1)
  (if (<= (expt 10 999) fn1)
    i
    (e025 (1+ i) (+ fn fn1) fn)))

(display (e025 1 1 1))

