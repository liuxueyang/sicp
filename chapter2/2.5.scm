(load "utility")

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (divx n m)
  (define (iter x res)
    (if (divides? m x)
        (iter (/ x m)
              (1+ res))
        res))
  (iter n 0))

(define (car n)
  (divx n 2))

(define (cdr n)
  (divx n 3))

(car (cons 1 2))
;; 1
(cdr (cons 1 2))
;; 2

(car (cons 4 3))
;; 4
(cdr (cons 4 3))
;; 3
