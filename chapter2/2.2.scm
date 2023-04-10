(load "utility")

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment a b)
  (cons a b))

(define (start-segment p)
  (car p))

(define (end-segment p)
  (cdr p))

(define (mid-point seg)
  (let ((a (start-segment seg))
        (b (end-segment seg)))
    (make-point (average (x-point a)
                         (x-point b))
                (average (y-point a)
                         (y-point b)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point
 (mid-point (make-segment (make-point 1 2)
                          (make-point 3 4))))
