
;; iterative implementation of sum
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (+ result (term a)))))
  (iter a 0))

;; test new sum

(define (simpson-integral f a b n)
  (define h (/ (- b a) (* 1.0 n)))

  (define (term k)
    (* (cond ((or (zero? k)
                  (= k n)) 1)
             ((even? k) 2)
             (else 4))
       (f (+ a (* k h)))))

  (*
   (/ h 3.0)
   (sum term 0 1+ n)))

(simpson-integral cube 0 1 100)
;; .25000000000000006
(simpson-integral cube 0 1 1000)
;; .25000000000000006
