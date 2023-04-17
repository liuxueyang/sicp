(load "chapter2/nested_mapping")

(define (unique-pairs n)
  (flatmap append
           (map (lambda (i)
                  (map (lambda (j) (list j i))
                       (enumerate-interval 1 (1- i))))
                (enumerate-interval 1 n))))

(unique-pairs 4)
;; ((1 2)
;;  (1 3)
;;  (2 3)
;;  (1 4)
;;  (2 4)
;;  (3 4))


(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

(prime-sum-pairs 7)
;; ((1 2 3)
;;  (2 3 5)
;;  (1 4 5)
;;  (3 4 7)
;;  (2 5 7)
;;  (1 6 7)
;;  (5 6 11)
;;  (4 7 11)
;;  (6 7 13))
