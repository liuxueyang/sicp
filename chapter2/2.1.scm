(load "utility")

(define (neg x)
  (- 0 x))

(define (make-rat n d)
  (let ((positive (> (* n d) 0)))
    (if positive
        (let ((g (gcd n d)))
          (cons (/ n g)
                (/ d g)))
        (let ((n1 (if (> n 0) n (neg n)))
              (d1 (if (> d 0) d (neg d))))
          (let ((g (gcd n1 d1)))
            (cons (neg (/ n1 g))
                  (/ d1 g)))))))

(make-rat 2 -3)
(make-rat 3 -2)
(make-rat 2 -4)
(make-rat 4 -2)
