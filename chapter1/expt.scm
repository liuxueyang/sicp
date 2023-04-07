
(define (expt-1 a n)
  (if (= n 0)
      1
      (* a (expt-1 a (- n 1)))))

(define (expt-2-iter a n product)
  (if (= n 0)
      product
      (expt-2-iter a (- n 1) (* product a))))

(define (expt-2 a n)
  (expt-2-iter a n 1))

(define (square n) (* n n))
(define (zero? n) (= n 0))
(define (even? n) (= 0 (remainder n 2)))
(define (odd? n) (not (even? n)))
(define (half n) (/ n 2))
(define (1- n) (- n 1))
(define (1+ n) (+ n 1))

(define (expt-fast a n)
  (cond ((= n 0) 1)
        ((even? n) (square (expt-fast a (/ n 2))))
        (else (* a (expt-fast a (- n 1))))))
