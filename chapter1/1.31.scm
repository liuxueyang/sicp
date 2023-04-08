;; recursive process
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (id a) a)

(define (factorial n)
  (product id 1 1+ n))

(factorial 5)

(define (pi-product a b)
  (define (term i)
    (define denominator (+ 2
                           (if (even? i)
                               (1- i)
                               i)))
    (define numerator
      (if (= i 1)
          2
          (* 2
             (/ (if (even? i)
                    (+ 2 i)
                    (1+ i))
                2))))

    (/ numerator
       denominator))

  (product term a 1+ b))

(* 4.0 (pi-product 1 1000))
;; 3.1431607055322663


;; iterative process
(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* result (term a)))))
  (iter a 1))

(define (pi-product-iterative a b)
  (define (term i)
    (define denominator (+ 2
                           (if (even? i)
                               (1- i)
                               i)))
    (define numerator
      (if (= i 1)
          2
          (* 2
             (/ (if (even? i)
                    (+ 2 i)
                    (1+ i))
                2))))

    (/ numerator
       denominator))

  (product-iterative term a 1+ b))

(* 4.0 (pi-product-iterative 1 1000))
;; 3.1431607055322663
