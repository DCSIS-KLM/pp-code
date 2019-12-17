#lang racket

(define (my-delay f) 
  (mcons #f f))

(define (my-force th)
  (if (mcar th)
      (mcdr th)
      (begin (set-mcar! th #t)
             (set-mcdr! th ((mcdr th)))
             (mcdr th))))

(define (my-mult x y)
  (cond [(= x 0) 0]
        [(= x 1) y]
        [#t (+ y (my-mult (- x 1) y))]))
;(define e1 10)
;(define e2 50)
;(define (my-mult x y-thunk)
;  (cond [(= x 0) 0]
;        [(= x 1) (y-thunk)]
;        [#t (+ (y-thunk) (my-mult (- x 1) y-thunk))]))
;
;(my-mult e1 (let ([x (my-delay (lambda () e2))]) (lambda () (my-force x))))
;
;(define (my-mult x y-promise)
;  (cond [(= x 0) 0]
;        [(= x 1) (my-force y-promise)]
;        [#t (+ (my-force y-promise) (my-mult (- x 1) y-promise))]))

;(my-mult e1 (my-delay (lambda () e2)))
