(load "utility")

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (zero? i)
        result
        (iter (1- i)
              (/ (n i)
                 (+ (d i)
                    result)))))
  (iter k 0))

(+ 2
   (cont-frac-iter (lambda (i) 1.0)
                   (lambda (i)
                     (if (zero? (remainder (1+ i)
                                           3))
                         (double (/ (1+ i)
                                    3))
                         1))
                   10))
;; 2.7182817182817183
