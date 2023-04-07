(define (square n) (* n n))
(define (zero? n) (= n 0))
(define (even? n) (= 0 (remainder n 2)))
(define (odd? n) (not (even? n)))
(define (half n) (/ n 2))
(define (1- n) (- n 1))
(define (1+ n) (+ n 1))

(define (halve n) (/ n 2))
(define (double n) (+ n n))

(define (fast-multiply-iter a b sum)
  (cond ((zero? b) sum)
        ((even? b) (fast-multiply-iter (double a)
                                       (halve b)
                                       sum))
        (else (fast-multiply-iter a
                                  (1- b)
                                  (+ sum a)))))

(define (fast-multiply a b)
  (fast-multiply-iter a b 0))
