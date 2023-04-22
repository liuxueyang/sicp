(load "chapter2/sequence")
(load "utility")

(define (safe? k positions)
  (define (iter k positions result)
    (if (null? positions)
        result
        (iter (1- k)
              (cdr positions)
              (append result
                      (list (list (car positions) k))))))

  (define (check f x y)
    (= (f x)
       (f y)))

  (if (null? positions)
      true
      (null?
       (let ((lst (iter k positions nil)))
         (let ((x (car lst)))
           (map car (filter (lambda (p) (or (check car x p)
                                            (check (lambda (x)
                                                     (+ (car x)
                                                        (cadr x))) x p)
                                            (check (lambda (x)
                                                     (- (car x)
                                                        (cadr x))) x p)))
                            (cdr lst))))))))

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define empty-board ())

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 4)
;; ((3 1 4 2) (2 4 1 3))
