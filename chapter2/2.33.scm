(load "chapter2/sequence")

(define (map-1 p sequence)
  (accumulate (lambda (x y)
                (cons (p x) y))
              () sequence))

(map-1 square '(1 2 3 4 5))

(define (append-1 seq1 seq2)
  (accumulate cons seq2 seq1))

(append-1 '(1 2 3)
          '(4 5 6))

(define (length-1 sequence)
  (accumulate (lambda (x y)
                (+ 1 y))
              0 sequence))

(length-1 '(1 2 3))
