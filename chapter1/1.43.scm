(load "chapter1/1.42.scm")

(define (repeated f n)
  (if (= 1 n)
      f
      (compose f (repeated f (1- n)))))

((repeated square 2) 5)
