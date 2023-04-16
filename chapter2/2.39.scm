(load "chapter2/2.38.scm")

(define (reverse-right sequence)
  (fold-right (lambda (x y)
                (append y (list x)))
              ()
              sequence))

(reverse-right '(1 2 3))
;; (3 2 1)

(define (reverse-left sequence)
  (fold-left (lambda (x y)
               (append (list y) x))
             ()
             sequence))

(reverse-left '(1 2 3))
;; (3 2 1)
