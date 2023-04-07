(define (average x y)
  (/ (+ x y)
     2))

(define (improve guess x)
  (average (/ x guess)
           guess))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (improve guess x)
             guess))
     1e-10))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt-2 x)
  (sqrt-iter 1.0 x))

(display (square (sqrt-2 (- 1e10 1000))))

(newline)

(display (square (sqrt-2 1e-10)))
