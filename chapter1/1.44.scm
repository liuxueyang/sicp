(load "chapter1/1.43.scm")

(define (smooth f)
  (lambda (x)
    (let ((dx 0.00001))
      (/ (+ (f (- x dx))
            (f x)
            (f (+ x dx)))
         3))))

(define (fold-smoothed f n)
  ((repeated smooth n) f))

((smooth square) 2)
;; 4.000000000066667
((fold-smoothed square 3) 2)
;; 4.0000000002
