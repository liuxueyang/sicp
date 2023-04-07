
(define (pascal-triangle i j)
  (if (or (= 1 j)
          (= i j))
      1
      (+ (pascal-triangle (- i 1) (- j 1))
         (pascal-triangle (- i 1) j))))
