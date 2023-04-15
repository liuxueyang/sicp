(define (tree-map f lst)
  (map (lambda (x)
         (if (pair? x)
             (tree-map f x)
             (f x)))
       lst))

(define (square-tree lst)
  (tree-map square lst))

(square-tree '(1 (2 (3 4) 5)
                 (6 7)))
;; (1 (4 (9 16) 25) (36 49))
