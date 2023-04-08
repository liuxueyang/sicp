(define (filtered-accumulate combiner filter null-value term a next b)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a)
           (iter (next a)
                 (combiner result (term a))))
          (else (iter (next a) result))))
  (iter a null-value))

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

(define (prime? n) (fast-prime? n 5))

(define (id a) a)

;; subproblem a.
(define (sum-square-prime a b)
  (filtered-accumulate + prime? 0 square a 1+ b))

(sum-square-prime 2 10)
;; 87
(+ (square 2)
   (square 3)
   (square 5)
   (square 7))
;; 87

;; subproblem b.
(define (gcd a b)
  (if (zero? b)
      a
      (gcd b (remainder a b))))

(define (product-prime-to-n n)
  (define (filter x)
    (= 1 (gcd x n)))
  (filtered-accumulate * filter 1
                       id 1 1+ n))

(product-prime-to-n 10)
;; 189
(* 3 7 9)
;; 189
