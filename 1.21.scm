(define (divides? a b)
  (zero? (remainder b a)))

(define (find-divisor n a)
  (cond ((> (square a) n) n)
        ((divides? a n) a)
        (else (find-divisor n (1+ a)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
