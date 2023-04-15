(define (for-each f lst)
  (cond ((null? lst) #t)
        (else
         (f (car lst))
         (for-each f (cdr lst)))))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))
