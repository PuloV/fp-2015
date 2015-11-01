#lang racket/base

(define (sum term a next b)
	(if (>= a b)
		(term a)
		(+
			(term a)
			(sum term (next a) next b)
		)
	)
)

(sum
	(lambda (x) x)
	0
	(lambda (x) (+ x 1))
	3
)


(define (paly-count start end)
	(sum
		(lambda (x) (if (pal? x) 1 0))
		start
		(lambda (x) (+ x 1))
		end
	)
)