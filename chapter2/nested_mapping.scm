(load "chapter2/sequence")
(load "utility")

(define (flatmap proc seq)
  (accumulate append nil
              (map proc seq)))

(define (prime-sum? p)
  (prime? (+ (car p)
             (cadr p))))

(define (make-pair-sum p)
  (list (car p)
        (cadr p)
        (+ (car p)
           (cadr p))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (accumulate append nil
                           (map (lambda (i)
                                  (map (lambda (j) (list j i))
                                       (enumerate-interval 1 (1- i))))
                                (enumerate-interval 1 n))))))

(prime-sum-pairs 7)
;; ((1 2 3)
;;  (2 3 5)
;;  (1 4 5)
;;  (3 4 7)
;;  (1 5 6)
;;  (2 5 7)
;;  (1 6 7)
;;  (5 6 11)
;;  (4 7 11)
;;  (6 7 13))

(define (remove x lst)
  (filter (lambda (i) (not (= x i)))
          lst))

(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap
       (lambda (x)
         (map (lambda (p) (cons x p))
              (permutations (remove x s))))
       s)))

(permutations '(1 2 3))
;; ((1 2 3)
;;  (1 3 2)
;;  (2 1 3)
;;  (2 3 1)
;;  (3 1 2)
;;  (3 2 1))
