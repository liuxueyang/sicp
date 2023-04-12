
(define (last-pair lst)
  (if (null? (cdr lst))
      lst
      (last-pair (cdr lst))))

(last-pair (list 1 2 3))
(last-pair (list 1))
