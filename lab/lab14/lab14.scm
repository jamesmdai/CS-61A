; Lab 14: Final Review

(define (compose-all funcs)
    (define (helper fxs result)
        (if (null? fxs)
            result
            (helper (cdr fxs) (lambda (x) ((car fxs) (result x)))))
    )
    (helper funcs (lambda (x) x))
)

(define (has-cycle? s)
  (define (pair-tracker seen-so-far curr)
    (cond ((contains? seen-so-far curr) #t)
          ((null? curr) #f)
          (else (pair-tracker (cons curr seen-so-far) (cdr-stream curr))))
    )
(pair-tracker nil s)
)

(define (contains? lst s)
  (cond ((null? lst) #f)
        ((eq? (car lst) s))
        (else (contains? (cdr lst) s))
      )
)


