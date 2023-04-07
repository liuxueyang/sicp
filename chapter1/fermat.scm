#lang sicp

(define (square n) (* n n))
(define (zero? n) (= n 0))
(define (even? n) (= 0 (remainder n 2)))
(define (odd? n) (not (even? n)))
(define (half n) (/ n 2))
(define (1- n) (- n 1))
(define (1+ n) (+ n 1))


(define (expmod a m n)
  (cond ((= 0 m) 1)
        ((even? m)
         (remainder (square (expmod a
                                    (/ m 2)
                                    n))
                    n))
        (else
         (remainder (* a (expmod a (1- m) n))
                    n))))

(define (try a n)
  (= (expmod a n n) a))

(define (fermat-test n)
  (try (1+ (random (1- n)))
       n))

(fermat-test 2)
(fermat-test 31)
(fermat-test 37)
(fermat-test 18)
(fermat-test 25)

(define (fast-prime? n times)
  (cond ((zero? times) #t)
        ((fermat-test n) (fast-prime? n (1- times)))
        (else #f)))

(fast-prime? 2 5)
(fast-prime? 31 5)
(fast-prime? 37 5)
(fast-prime? 18 5)
(fast-prime? 25 5)
