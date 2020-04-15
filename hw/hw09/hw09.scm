
; Tail recursion

(define (replicate x n)
    (define (helper num lst)
        (if (= num 0) lst
            (helper (- num 1) (append (list x) lst))))
    (helper n nil)
  )

(define (accumulate combiner start n term)
    (if (= n 0) start
        (combiner (term n) (accumulate combiner start (- n 1) term)))
)

(define (accumulate-tail combiner start n term)
  (if (= n 0) start (accumulate-tail combiner (combiner start (term n)) (- n 1) term))
)

; Streams

(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))
 

(define multiples-of-three
    (cons-stream 3 (map-stream (lambda (x) (+ x 3)) multiples-of-three))
)

(define (nondecreastream s)
    (define (list_constructor stream)
       (cond
           ((null? (cdr-stream stream)) (list (car stream)))
           ((> (car stream) (car (cdr-stream stream))) (list (car stream)))
           (else (cons (car stream) (list_constructor (cdr-stream stream))))
       )
    )
    (define (rest_finder stream)
       (cond
           ((null? (cdr-stream stream)) nil)
           ((> (car stream) (car (cdr-stream stream))) (cdr-stream stream))
           (else (rest_finder (cdr-stream stream)))
       )
    )
   (if (null? s) nil
        (cons-stream (list_constructor s) (nondecreastream (rest_finder s))))
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))