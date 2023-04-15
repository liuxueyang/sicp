(define (square-tree lst)
  (cond ((null? lst) ())
        ((not (pair? lst))
         (square lst))
        (else
         (cons (square-tree (car lst))
               (square-tree (cdr lst))))))

(square-tree '(1 (2 (3 4) 5)
                 (6 7)))
;; (1 (4 (9 16) 25) (36 49))

(define (square-tree-1 lst)
  (map (lambda (x)
         (if (pair? x)
             (square-tree-1 x)
             (square x)))
       lst))

(square-tree-1 '(1 (2 (3 4) 5)
                   (6 7)))
;; (1 (4 (9 16) 25) (36 49))
