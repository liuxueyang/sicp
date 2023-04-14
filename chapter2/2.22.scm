(load "utility")

(define (square-list items)
  (define (iter lst result)
    (if (null? lst)
        result
        (iter (cdr lst)
              (append result (list (square (car lst)))))))
  (iter items ()))

(square-list '(3 10 9))
