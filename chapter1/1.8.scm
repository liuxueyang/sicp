(define (average x y)
  (/ (+ x y)
     2))

(define (square x)
  (* x x))

(define (cube x)
  (* x
     (square x)))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
   3))

(define (good-enough? guess x)
  (< (abs (- (improve guess x)
             guess))
     1e-10))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(display (cube (cube-root (- 1e10 1000))))

(newline)

(display (cube (cube-root 1e-10)))
