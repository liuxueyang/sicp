
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? x y)
    (< (abs (- x y))
       tolerance))
  (define (try x)
    (let ((next (f x)))
      (if (close-enough? x next)
          next
          (try next))))
  (try first-guess))

(fixed-point cos 1.0)

(define (average x y)
  (/ (+ x y)
     2))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(sqrt 2)
