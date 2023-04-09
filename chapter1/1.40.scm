(load "utility")

(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))

(newton-method (cubic 1 2 3) 1)
