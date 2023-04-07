(define (fib-iter-1 a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter-1 a
                   b
                   (+ (square p)
                      (square q))
                   (+ (* 2 p q)
                      (square q))
                   (/ count 2)))
        (else
         (fib-iter-1 (+ (* b q) (* a q) (* a p))
                   (+ (* b p) (* a q))
                   p
                   q
                   (- count 1)))))

(define (fib-1 n)
  (fib-iter-1 1 0 0 1 n))
