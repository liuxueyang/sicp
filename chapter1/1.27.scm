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

(fast-prime? 561 5)
(fast-prime? 1105 5)
(fast-prime? 1729 5)
(fast-prime? 2465 5)
(fast-prime? 2821 5)
(fast-prime? 6601 5)

(define (fool-fermat-test n)
  (define (iter i)
    (cond ((= i n) true)
          ((not (= (expmod i n n)
                   i)) false)
          (else (iter (+ i 1)))))
  (iter 1))

(fool-fermat-test 561)
(fool-fermat-test 1105)
(fool-fermat-test 1729)
(fool-fermat-test 2465)
(fool-fermat-test 2821)
(fool-fermat-test 6601)
