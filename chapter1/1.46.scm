(load "utility")

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  iter)

(define (sqrt x)
  (define tolerance 1e-10)

  ((iterative-improve (lambda (guess)
                        (< (abs (- (square guess)
                                   x))
                           tolerance))
                      (lambda (guess)
                        (average (/ x guess)
                                 guess)))
   1.0))

(sqrt 2)
;; 1.4142135623746899

(define (fixed-point f first-guess)
  (define tolerance 1e-10)

  ((iterative-improve (lambda (guess)
                        (< (abs (- guess
                                   (f guess)))
                           tolerance))

                      f)
   first-guess))

(define (sqrt-1 x)
  (fixed-point (lambda (y)
                 (average y (/ x y)))
               1.0))

(sqrt-1 2)
;; 1.4142135623746899
