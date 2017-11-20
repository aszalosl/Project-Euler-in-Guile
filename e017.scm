
;; Problem #17
; If all the numbers from 1 to 1000 (one thousand) inclusive were written 
; out in words, how many letters would be used? 
;guile
(use-modules (srfi srfi-42)) ; for list comprehension
(define numbers
  '((0 . "") (1 . "one") (2 . "two") (3 . "three")
    (4 . "four") (5 . "five") (6 . "six") (7 . "seven") (8 . "eight")
    (9 . "nine") (10 . "ten") (11 . "eleven") (12 . "twelve") (13 . "thirteen")
    (14 . "fourteen") (15 . "fifteen") (16 . "sixteen") (17 . "seventeen")
    (18 . "eighteen") (19 . "nineteen") (20 . "twenty") (30 . "thirty")
    (40 . "forty") (50 . "fifty") (60 . "sixty") (70 . "seventy")
    (80 . "eighty") (90 . "ninety")))

; 1st variant
(define (write-number-rec n)
  (if (> n 1000)   ; 1000
    (string-append 
      (write-number-rec (quotient n 1000))  " thousand "
      (if (< 0 (remainder n 1000)) "and " "")
      (write-number (remainder n 1000)))
    (if (> n 100)  ;100
      (string-append 
        (write-number-rec (quotient n 100)) " hundred "
        (if (< 0 (remainder n 100)) "and " "")
        (write-number (remainder n 100)))
      (if (assoc-ref numbers n)
       (assoc-ref numbers n)
       (string-append (write-number-rec (* 10 (quotient n 10))) "-" 
                      (write-number-rec (remainder n 10)))))))
;; TODO cannot be put into a cycle

; 2nd variant
(define (flatten x) ; from rosettacode.org
    (cond ((null? x) '())
          ((not (pair? x)) (list x))
          (else (append (flatten (car x))
                        (flatten (cdr x))))))
(define (write-number n)
  (let* ((th (quotient n 1000))
         (hu (quotient (remainder n 1000) 100))
         (left (remainder n 100))
         (ones (remainder n 10))
         (tens (- left ones)))
  (apply string-append (flatten (list 
    (if (zero? th) "" 
      (append (list (assoc-ref numbers th) " thousand ")
              (list (if (zero? (+ hu tens ones)) "" "and "))))
    (if (zero? hu) "" 
      (append (list (assoc-ref numbers hu) " hundred ")
              (list (if (zero? (+ tens ones)) "" "and "))))
    (if (assoc-ref numbers left)
      (assoc-ref numbers left)
      (string-append (assoc-ref numbers tens) "-" 
                     (assoc-ref numbers ones))))))))
(define (len-without-spaces str)
  (string-length (string-delete (lambda (ch) (char>? #\@ ch)) str)))
(define (e017)
  (apply + (list-ec (:range i 1 1001) (len-without-spaces (write-number i)))))
; (e017)

; 3rd variant
(define (e017b) 
  (define (sum i total)
    (if (> i 1000)
      total
      (sum (1+ i) (+ (vector-ref letters i) total))))
  (define letters (make-vector 1002 0))
  ; fill the specific cases
  (for-each (lambda (x) (vector-set! letters (car x) (cdr x)))
            '((1 . 3) (2 . 3 ) (3 . 5) (4 . 4) (5 . 4) (6 . 3) (7 . 5) (8 . 5) 
              (9 . 4) (10 . 3) (11 . 6) (12 . 6) (13 . 8) (14 . 8) (15 . 7) 
              (16 . 7) (17 . 9) (18 . 8) (19 . 8) (20 . 6) (30 . 6) (40 . 5) 
              (50 . 5) (60 . 5) (70 . 7) (80 . 6) (90 . 6) (1000 . 11)))

  ; numbers smaller than 100
  (do ((i 21 (1+ i))) ((= i 100)) 
    (vector-set! letters i (+
                   (vector-ref letters (remainder i 10))
                   (vector-ref letters (- i (remainder i 10))))))

  ; ordinary number: ? hundred and ?
  (do ((i 100 (1+ i))) ((= i 1000))
    (vector-set! letters i (+ (vector-ref letters (remainder i 100))
                              (vector-ref letters (quotient i 100)) 
                              10)))
  ; hundreds
  (do ((i 100 (+ 100 i))) ((= i 1000))
    (vector-set! letters i (+ (vector-ref letters (quotient i 100)) 7)))
  ; summing up
  (sum 1 0))
(display (e017b))
