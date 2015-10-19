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

(define (detect x)
  (if (odd? x)
	(lambda (c) (+ x c))
	(lambda () (+ x 42))
        )
  )

(define A (detect 2))
(define B (detect 3))
(A)
(B 3)