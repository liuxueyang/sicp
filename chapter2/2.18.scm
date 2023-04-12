
(define (reverse lst)
  (define (helper x res)
    (if (null? x)
        res
        (helper (cdr x)
                (cons (car x) res))))
  (helper lst ()))

(reverse (list 1 2 3))
(reverse (list 1))
