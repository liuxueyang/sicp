(load "utility")

(define (inc x)
  (1+ x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

((compose square inc) 6)
