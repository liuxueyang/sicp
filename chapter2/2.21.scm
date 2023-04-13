(load "utility")

(define (square-list items)
  (if (null? items)
      ()
      (cons (square (car items))
            (square-list (cdr items)))))

(square-list '(3 10 9))

(define (square-list-1 items)
  (map square items))

(square-list-1 '(3 10 9))
