(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x)
  (1+ x))

((double inc) 1)

(((double double) inc) 1)
;; 5

(((double (double double))
  inc) 5)
;; 21

(define (double2 f)
  (double (double f)))

((double2 inc) 1)
;; 5

