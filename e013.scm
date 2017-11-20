(use-modules (ice-9 rdelim)) ; input numbers from file

(define (e013)
  (let ((input (open-input-file "numbers13.txt")))
    (let loop ((line (read-line input)) (sum 0))
      (if (not (eof-object? line))
	  (loop (read-line input) (+ sum (string->number line)))
	  (substring 
	    (number->string sum)
	    0 10)))))

(display (e013))
