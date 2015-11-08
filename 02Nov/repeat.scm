#lang racket/base

(require (file "accumulate.scm"))
(provide repeat)

(define (repeat f n)
  (accumulate
  	(lambda (func result) (lambda (x) (func (result x))))
  	f
  	(lambda (x) f)
  	1
  	(lambda (x) (+ x 1))
  	n
  )
)

;(let
;      (
;       (by4 (repeat (lambda (x) (* x 2)) 2))
;       )
;(by4 3))