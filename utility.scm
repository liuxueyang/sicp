(define (half n) (/ n 2))
(define (halve n) (/ n 2))
(define (double n) (+ n n))
(define (1- n) (- n 1))
(define (1+ n) (+ n 1))
(define (divides? a b) (zero? (remainder b a)))

(define (average x y)
  (/ (+ x y)
     2))

(define (id a) a)

(define (gcd a b)
  (if (zero? b)
      a
      (gcd b (remainder a b))))

(define (expmod a m n)
  (cond ((= 0 m) 1)
        ((even? m)
         (remainder (square (expmod a
                                    (/ m 2)
                                    n))
                    n))
        (else
         (remainder (* a (expmod a (1- m) n))
                    n))))

(define (prime? n)
  (define (fast-prime? n times)
    (define (try a n)
      (= (expmod a n n) a))

    (define (fermat-test n)
      (try (1+ (random (1- n)))
           n))

    (cond ((zero? times) #t)
          ((fermat-test n) (fast-prime? n (1- times)))
          (else #f)))
  (fast-prime? n 5))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)

  (define (close-enough? x y)
    (< (abs (- x y))
       tolerance))

  (define (try x)
    (let ((next (f x)))
      (if (close-enough? x next)
          next
          (try next))))

  (try first-guess))

(define (newton-method g guess)
  (define (deriv g)
    (define dx 0.00001)

    (lambda (x)
      (/ (- (g (+ x dx))
            (g x))
         dx)))

  (define (newton-transform g)
    (lambda (x)
      (- x (/ (g x)
              ((deriv g) x)))))

  (fixed-point (newton-transform g) guess))
