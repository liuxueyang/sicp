(load "utility")

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx))
          (g x))
       dx)))

(define (cube x) (* x (square x)))

((deriv cube) 5)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (newton-sqrt x)
  (newton-method (lambda (y) (- (square y)
                                x))
                 1.0))

(newton-sqrt 2)

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define (sqrt-1 x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

(sqrt-1 2)

(define (sqrt-2 x)
  (fixed-point-of-transform (lambda (y) (- (square y)
                                           x))
                            newton-transform
                            1.0))

(sqrt-2 2)
