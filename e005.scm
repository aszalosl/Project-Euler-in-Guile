;; Problem #5
;; 2520 is the smallest number that can be divided by each of the numbers 
;; from 1 to 10 without any remainder.
;; What is the smallest positive number that is evenly divisible by all 
;; of the numbers from 1 to 20?

(add-to-load-path ".")
(use-modules (euler-module)   ; factor
             (srfi srfi-42))  ; list comprehension

(define (group-factors factor-list counter)
  ; from the list of the factors create a list of pairs factor(base)-exponent
  (if (null? (cdr factor-list))
    (list (cons (car factor-list) counter))
    (if (= (car factor-list) (cadr factor-list))
      (group-factors (cdr factor-list) (1+ counter))
      (cons (cons (car factor-list) counter)
            (group-factors (cdr factor-list) 1)))))

(define (max-associative pairs new-pair)
  ; joins two list of pairs with same base, 
  ; taking the pair with higher exponent
  (if (null? pairs)
    (list new-pair)
    (if (= (caar pairs) (car new-pair)) ; common key
      (if (< (cdar pairs) (cdr new-pair))
        (cons new-pair (cdr pairs))
        pairs)
      (cons (car pairs)
            (max-associative (cdr pairs) new-pair)))))

(define (max-pairs pairs factors)
  ; apply the max-associative for all lists
  (if (null? factors)
    pairs
    (max-pairs (max-associative pairs (car factors)) (cdr factors))))

(define (prime-powers factors product) 
  ; from prime-power pairs to natural numbers
  (if (null? factors)
    product
    (prime-powers (cdr factors) 
                  (* product (integer-expt (caar factors) (cdar factors))))))
(define (e005 limit)
  (prime-powers 
    (max-pairs '() 
               (apply append (list-ec (:range i 2 limit) 
                                      (group-factors (factors i) 1))))
    1))
;(e005 10)
(display (e005 20))

; shorter variant:
;(apply lcm (list-ec (:range i 2 20) i))

