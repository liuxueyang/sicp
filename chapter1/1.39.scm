(load "utility")

(define (tan-cf x k)
  (define (term i)
    (1- (double i)))
  (define (help i)
    (if (= i k)
        (term i)
        (- (term i)
           (/ (square x)
              (help (1+ i))))))
  (/ x (help 1)))

(tan-cf (/ 3.1415926 4) 100)
;; .9999999732051038
