(load "chapter2/sequence")

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define fold-right accumulate)

(fold-right / 1 '(1 2 3))
;; 3/2

(fold-left / 1 '(1 2 3))
;; 1/6

(fold-right list () '(1 2 3))
;; (1 (2 (3 ())))

(fold-left list () '(1 2 3))
;; (((() 1) 2) 3)

;; property: (op x y) = (op y x)
