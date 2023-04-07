
(define (fib-iter a b count)
  (if (= 0 count)
      a
      (fib-iter b (+ a b) (- count 1))))

(define (fib n)
  (fib-iter 0 1 n))
