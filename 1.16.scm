
(define (square n) (* n n))
(define (zero? n) (= n 0))
(define (even? n) (= 0 (remainder n 2)))
(define (odd? n) (not (even? n)))
(define (half n) (/ n 2))
(define (1- n) (- n 1))
(define (1+ n) (+ n 1))

(define (expt-fast-1-iter a b n)
  (cond ((zero? n) a)
        ((even? n) (expt-fast-1-iter a
                                     (square b)
                                     (half n)))
        (else (expt-fast-1-iter (* a b)
                                b
                                (1- n)))))

(define (expt-fast-1 a n)
  (expt-fast-1-iter 1 a n))
