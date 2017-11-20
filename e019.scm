;; Problem #19
; How many Sundays fell on the first of the month during the twentieth century 
; (1 Jan 1901 to 31 Dec 2000)?

(use-modules (srfi srfi-19)) ; date
(use-modules (srfi srfi-42)) ; for list comprehension
(define (e019)
  (length (filter zero? (list-ec (:range month 1 13) 
    (:range year 1901 2001) 
    (date-week-day (make-date 0 0 0 0 1 month year 0))))))
(display (e019))

