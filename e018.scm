;; Problem #18
; By starting at the top of the triangle below and moving to adjacent numbers
; on the row below, the maximum total from top to bottom is 23.
; Find the maximum total from top to bottom of the triangle below:
(use-modules (ice-9 rdelim))

(define (e018)
  (define (read-table input others)
    (let ((line (read-line input)))
      (if (not (eof-object? line))
        (read-table input (cons 
                            (map string->number (string-split line #\sp)) 
                            others))
        others)))

  (define nss (read-table (open-input-file "numbers18.txt") '()))
  (define (maxroute maxs line)
    (let [(left (map + (reverse (cdr (reverse maxs))) line))
          (right (map + (cdr maxs) line))]
      (map max left right)))
  (define (findroute nss sums)
    (if (null? nss)
      (car sums)
      (findroute (cdr nss) (maxroute sums (car nss)))))
  (findroute nss (make-list (1+ (length nss)) 0)))
(display (e018))

