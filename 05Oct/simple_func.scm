#lang racket/base

(define (square x) (* x x))

(define (abs x)
	(cond ((eq? x 0) ( 0))
			((> x 0) (x))
			((< x 0) (- x))
	)
)

(abs (- 5))
(abs 5)
(abs 0)

(square (square 2))