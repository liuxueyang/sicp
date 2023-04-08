
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (id a) a)

(define (sum-range a b)
  (sum id a 1+ b))

;; 1 + 2 + ... + 100
(sum-range 1 100)

(define (sum-cubes a b)
  (sum cube a 1+ b))

;; 1^3 + 2^3 + ... + 10^3
(sum-cubes 1 10)

(define (sum-pi a b)
  (define (term x)
    (/ 1.0 (* x (+ x 2))))
  (define (next x)
    (+ x 4))
  (* 8 (sum term a next b)))

(sum-pi 1 100000)

(define (integral f a b dx)
  (define (next x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0))
          next b)
     dx))

(integral cube 0 1 0.01)
;; .24998750000000042
(integral cube 0 1 0.001)
;; .249999875000001
