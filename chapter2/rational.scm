(load "utility")

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g)
          (/ d g))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (add-rat x y)
  (let ((n1 (numer x))
        (d1 (denom x))
        (n2 (numer y))
        (d2 (denom y)))
    (make-rat (+ (* n1 d2)
                 (* n2 d1))
              (* d1 d2))))

(define (sub-rat x y)
  (let ((n1 (numer x))
        (d1 (denom x))
        (n2 (numer y))
        (d2 (denom y)))
    (make-rat (- (* n1 d2)
                 (* n2 d1))
              (* d1 d2))))

(define (mul-rat x y)
  (let ((n1 (numer x))
        (d1 (denom x))
        (n2 (numer y))
        (d2 (denom y)))
    (make-rat (* n1 n2)
              (* d1 d2))))

(define (div-rat x y)
  (let ((n1 (numer x))
        (d1 (denom x))
        (n2 (numer y))
        (d2 (denom y)))
    (make-rat (* n1 d2)
              (* n2 d1))))

(define (equal-rat? x y)
  (let ((n1 (numer x))
        (d1 (denom x))
        (n2 (numer y))
        (d2 (denom y)))
    (= (* n1 d2)
       (* n2 d1))))

(define (print-rat x)
  (let ((n1 (numer x))
        (d1 (denom x)))
    (newline)
    (display n1)
    (display "/")
    (display d1)))

(define one-half (make-rat 1 2))
(print-rat one-half)

(define one-third (make-rat 1 3))
(print-rat one-third)

(print-rat (add-rat one-half one-third))

(print-rat (add-rat one-third one-third))

