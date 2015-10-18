#lang racket/base

(let
	(
		(x 1)
		(y 2)
		(S (lambda (x) (* x x)))
	)
	(display x) (newline)
	(display y) (newline)
	(display S) (newline)
	(S (+ x y))
)