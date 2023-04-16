(load "chapter1/fibonacci")

(define (filter predicate sequence)
  (cond ((null? sequence) ())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(filter odd? '(1 2 3 4 5))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(accumulate + 0 '(1 2 3 4 5))
(accumulate * 1 '(1 2 3 4 5))
(accumulate cons () '(1 2 3 4 5))

(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ 1 low)
                                    high))))

(enumerate-interval 2 7)

(define (enumerate-tree tree)
  (cond ((null? tree) ())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(enumerate-tree '(1 (2 (3 4)) 5))

(define (sum-odd-squares tree)
  (accumulate + 0 (map square (filter odd? (enumerate-tree tree)))))

(define (even-fibs n)
  (accumulate cons () (filter even? (map fib (enumerate-interval 0 n)))))

(even-fibs 10)
