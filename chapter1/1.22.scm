(define (divides? a b)
  (zero? (remainder b a)))

(define (find-divisor n a)
  (cond ((> (square a) n) n)
        ((divides? a n) a)
        (else (find-divisor n (1+ a)))))

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

(search-for-primes 100000000 100000039)
(search-for-primes 1000000000 1000000021)
(search-for-primes 10000000000 10000000061)

;; 10000000019 *** .09000000000000341
;; 10000000033 *** .0799999999999983
;; 10000000061 *** .0799999999999983
