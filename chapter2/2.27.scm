(define (deep-reverse lst)
  (define (helper x res)
    (if (null? x)
        res
        (helper (cdr x)
                (cons (deep-reverse (car x)) res))))
  (if (pair? lst)
      (helper lst ())
      lst))

(deep-reverse '((1 2) (3 5 4)))
(deep-reverse '((1 2) (3 (5 6) 4)))

