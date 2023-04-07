(define (divides? a b)
  (zero? (remainder b a)))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (find-divisor n a)
  (cond ((> (square a) n) n)
        ((divides? a n) a)
        (else (find-divisor n (next a)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime)
                       start-time))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (search-for-primes x y)
  (cond ((> x y) #f)
        ((odd? x)
         (timed-prime-test x)
         (search-for-primes (+ x 2) y))
        (else
         (search-for-primes (+ x 1) y))))

(timed-prime-test 10000000019)
(timed-prime-test 10000000033)
(timed-prime-test 10000000061)

;; 10000000019 *** 6.0000000000002274e-2
;; 10000000033 *** .04999999999999716
;; 10000000061 *** 6.0000000000002274e-2
