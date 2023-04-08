(define (half n) (/ n 2))
(define (halve n) (/ n 2))
(define (1- n) (- n 1))
(define (1+ n) (+ n 1))

(define (id a) a)

(define (gcd a b)
  (if (zero? b)
      a
      (gcd b (remainder a b))))

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

(define (prime? n)
  (define (fast-prime? n times)
    (define (try a n)
      (= (expmod a n n) a))

    (define (fermat-test n)
      (try (1+ (random (1- n)))
           n))

    (cond ((zero? times) #t)
          ((fermat-test n) (fast-prime? n (1- times)))
          (else #f)))
  (fast-prime? n 5))