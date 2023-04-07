
(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
         (* 2 (f-rec (- n 2)))
         (* 3 (f-rec (- n 3))))))

(define (f-iter a1 a2 a3 count)
  (if (= count 0)
      a1
      (f-iter a2 a3 (+ a3
                       (* 2 a2)
                       (* 3 a1))
              (- count 1))))

(define (f n)
  (f-iter 0 1 2 n))
