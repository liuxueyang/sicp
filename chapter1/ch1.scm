(define (square x) (* x x))

(square 3)

(square (+ 2 5))

(define (sum-of-squares x y)
  (+ (square x)
     (square y)))

(sum-of-squares 3 4)

(define (abs x)
  (cond ((> x 0) x)
        ((< x 0) (- x))
        ((= x 0) 0)))

(abs 3)
(abs -3)
(abs 0)

(define (abs-1 x)
  (cond ((< x 0) (- x))
        (else x)))

(abs-1 -3)
(abs-1 3)

(define (abs-2 x)
  (if (< x 0)
      (- x)
      x))

(abs-2 -3)
(abs-2 3)


