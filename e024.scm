;; Problem #24
; What is the millionth lexicographic permutation 
; of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

(use-modules (srfi srfi-42)) 

(define (fact n)
  (product-ec (: i 2 (1+ n)) i)) 

(define (left number index remaining-digits used-digits)
  (if (null? remaining-digits)
    (apply string-append (map number->string (reverse used-digits)))
    (let [(jump (fact (1- (length remaining-digits))))]
      (if (> number jump)
        (left (- number jump) (1+ index) remaining-digits used-digits)
        (let [(digit (list-ref remaining-digits index))]
          (left number 0 
                (delete digit remaining-digits) 
                (cons digit used-digits)))))))

(display (left (expt 10 6) 0 (list-ec (: i 10) i) '()))

; by using some math
; start with number-1!
(define (left2 number remaining-digits used-digits)
  (if (null? remaining-digits)
    (apply string-append (map number->string (reverse used-digits)))
    (let* [(jump (fact (1- (length remaining-digits))))
           (index (quotient number jump))
           (digit (list-ref remaining-digits index))]
      (left2 (remainder number jump)
            (delete digit remaining-digits) 
            (cons digit used-digits)))))

; (display (left2 999999 (list-ec (: i 10) i) '()))

