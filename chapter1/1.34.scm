
(define (f g)
  (g 2))

(f square)

(f (lambda (z)
     (* z (+ z 1))))

;; error
;; (f f)
;; (f 2)
;; (2 2)
