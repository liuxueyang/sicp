
(load "chapter1/fixed_point")

(define (phi guess)
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               guess))

(phi 1.0)
;; 1.6180327868852458
