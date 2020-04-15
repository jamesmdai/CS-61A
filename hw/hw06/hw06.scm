;;;;;;;;;;;;;;;
;; Questions ;;
;;;;;;;;;;;;;;;

; Scheme

(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car(cdr s)))

(define (caddr s)
  (car (cddr s)))

(define (sign x)
  (if (< x 0) -1 (if (> x 0) 1 0))
)

(define (square x) (* x x))

(define (pow b n)
    (if (= n 0) 1
        (if (even? n) (square(pow b (/ n 2))) (* b (pow b (- n 1)))))
)

(define (unique s)
    (if (null? s) s
        (cons (car s) (unique (filter (lambda (x) (not (equal? x (car s)))) (cdr s)))))
)