#lang racket/base

(require (file "derivative.scm"))
(require (file "repeat.scm"))

(provide derivative-n)

(define (derivative-n f n h)
	(define (der x) (derivative x h))
	((repeat der n) f)
)


