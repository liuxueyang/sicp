
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum-1 term a next b)
  (accumulate + 0 term a next b))

(define (id a) a)

(define (sum-range a b)
  (sum-1 id a 1+ b))

(sum-range 1 100)
;; 5050

(define (product-1 term a next b)
  (accumulate * 1 term a next b))

(define (factorial n)
  (product-1 id 1 1+ n))

(factorial 5)
;; 120

;; iterative accumulate
(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner result (term a)))))
  (iter a null-value))

(define (sum-1 term a next b)
  (accumulate-iterative + 0 term a next b))

(define (id a) a)

(define (sum-range a b)
  (sum-1 id a 1+ b))

(sum-range 1 100)
;; 5050

(define (product-1 term a next b)
  (accumulate-iterative * 1 term a next b))

(define (factorial n)
  (product-1 id 1 1+ n))

(factorial 5)
;; 120
