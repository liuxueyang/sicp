
(define (gcd a b)
  (if (zero? b)
      a
      (gcd b (remainder a b))))

(gcd 2 0)
(gcd 0 2)
(gcd 2 3)
(gcd 2 7)
(gcd 48 100)
