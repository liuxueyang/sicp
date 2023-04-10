
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(car (cons 10 30))

(define (cdr z)
  (z (lambda (p q) q)))

(cdr (cons 10 30))
