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

(define (fast-prime? n times)
  (cond ((zero? times) #t)
        ((fermat-test n) (fast-prime? n (1- times)))
        (else #f)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (if (fast-prime? n 5)
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

;; 10000000019 *** 0.
;; 10000000033 *** 0.
;; 10000000061 *** 0.
