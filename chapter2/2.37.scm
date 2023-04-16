(load "chapter2/2.36.scm")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product '(1 2 3)
             '(4 5 6))
;; 32

(define (matrix-*-vector m v)
  (map (lambda (x)
         (dot-product x v))
       m))

(matrix-*-vector '((1 2 3)
                   (4 5 6))
                 '(1 2 3))
;; (14 32)

(define (transpose mat)
  (accumulate-n cons () mat))

(transpose '((1 2 3)
             (4 5 6)))
;; ((1 4) (2 5) (3 6))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x)
           (matrix-*-vector cols x)) m)))

(matrix-*-matrix '((1 2 3)
                   (4 5 6))
                 '((1 4) (2 5) (3 6)))
;; ((14 32) (32 77))
