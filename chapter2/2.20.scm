
(define (same-parity x . lst)
  (define check
    (if (even? x)
        even?
        odd?))

  (define (iter lst res)
    (cond ((null? lst) res)
          ((check (car lst))
           (iter (cdr lst)
                 (append res (list (car lst)))))
          (else
           (iter (cdr lst)
                 res))))
  (iter lst (list x)))

(same-parity 1 2 3 4 5 6 7)
;; (1 3 5 7)
(same-parity 2 3 4 5 6 7)
;; (2 4 6)
