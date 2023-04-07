;; (lambda (x) (+ 1 x))

(+ 1 (call/cc
      (lambda (k)
        (+ 2 (k 3))))
   4)

(define (foo lst)
  (call/cc
   (lambda (k)
     (+ 2 (k 0)))))

(define (foo_bar)
  0)

(foo_bar)

(define r #f)

(define (zerop x) (= x 0))

(zerop 3)
(zerop 0)
(zero? 3)
(zero? 0)

(+ 1 (call/cc
      (lambda (k)
        (set! r k)
        (+ 2 (k 3)))))

(r 5)
(r 10)

(+ 10 (r 3))

(define (test)
  (define (loop i)
    (cond ((<= i 0) 'ok)
          (else (display i)
                (newline)
                (loop (- i 1)))))
  (loop 5))

(test)

(display 5)

(define (test_named)
  (let loop ((i 5))
    (cond ((<= i 0) 'ok)
          (else (display i)
                (newline)
                (loop (- i 1))))))

(test_named)

(define (lst-product lst)
  (if (null? lst) 1
      (* (car lst) (lst-product (cdr lst)))))

(lst-product '(1 2 3))

(define (lst-product-1 lst)
  (call/cc
   (lambda (cont)
     (if (null? lst) 1
         (let ((fst (car lst)))
           (if (zero? fst) (cont 0))
           (display fst)
           (newline)
           (* fst
              (lst-product-1 (cdr lst))))))))

(lst-product-1 '(1 2 3))
(lst-product-1 '(1 0 3))
