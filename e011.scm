;; Problem #11
;; In the 20×20 grid below, four numbers along a diagonal line have 
;; been marked in red. 
;; The product of these numbers is 26 × 63 × 78 × 14 = 1788696.
;; What is the greatest product of four adjacent numbers in the 
;; same direction (up, down, left, right, or diagonally) in the 20×20 grid?
(use-modules (ice-9 rdelim)) ; for loading numbers
(use-modules (srfi srfi-42)) ; for list comprehension
(define (e011)
  (define (read-table input others)
    (let ((line (read-line input)))
      (if (not (eof-object? line))
        (read-table input (cons 
                            (map string->number (string-split line #\sp)) 
                            others))
        others)))
  (define nss (read-table (open-input-file "numbers11.txt") '()))
  (define (total x y dx dy l prod)
    (if (zero? l)
      prod
      (total (+ x dx) (+ y dy) dx dy (1- l) 
             (* prod (list-ref (list-ref nss x) y)))))
  (max
    (apply max (list-ec (:range i 0 16) (:range j 0 20) (total i j 1 0 4 1)))
    (apply max (list-ec (:range j 0 16) (:range i 0 20) (total i j 0 1 4 1)))
    (apply max (list-ec (:range i 0 16) (:range j 0 16) (total i j 1 1 4 1))) 
    (apply max (list-ec (:range i 0 16) (:range j 4 20) (total i j 1 -1 4 1)))))

(display (e011))
