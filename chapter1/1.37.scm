
(load "utility")

(define (cont-frac n d k)
  (define (help i)
    (if (= i k)
        (/ (n i)
           (d i))
        (/ (n i)
           (+ (d i)
              (help (1+ i))))))
  (help 1))

(/ 1
   (cont-frac (lambda (i) 1.0)
              (lambda (i) 1.0)
              13))
;; 1.6180257510729614

;; iterative process

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (zero? i)
        result
        (iter (1- i)
              (/ (n i)
                 (+ (d i)
                    result)))))
  (iter k 0))

(/ 1
   (cont-frac-iter (lambda (i) 1.0)
                   (lambda (i) 1.0)
                   13))
;; 1.6180257510729614
