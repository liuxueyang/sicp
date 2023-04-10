
(define (cons x y)
  (define (dispatch i)
    (cond ((= i 0) x)
          ((= i 1) y)
          (else (error "Argument not 0 or 1: CONS" i))))
  dispatch)

(define (car c) (c 0))
(define (cdr c) (c 1))

(car (cons 3 10))
;; 3
(cdr (cons 3 10))
;; 10
