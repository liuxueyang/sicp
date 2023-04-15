(define (fringe lst)
  (define (helper x res)
    (cond ((null? x) res)
          ((not (pair? x))
           (append res (list x)))
          (else (helper (cdr x)
                        (helper (car x) res)))))
  (helper lst ()))


(define x '((1 2) (3 4)))
(fringe x)
(fringe (list x x))
