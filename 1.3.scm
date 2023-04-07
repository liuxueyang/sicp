
(define (min2 x y)
  (if (< x y)
      x
      y))

(define (min3 x y z)
  (min2 (min2 x y)
        z))

(define (square x)
  (* x x))

(define (sum-squares-larger-2 x y z)
  (- (+ (square x)
        (square y)
        (square z))
     (square (min3 x y z))))

(sum-squares-larger-2 1 2 3)
(sum-squares-larger-2 1 0 3)
