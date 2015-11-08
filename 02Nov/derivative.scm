#lang racket/base

(provide derivative)

(define (derivative f h)
	(lambda (x)
		(let (
				(y (- x h))
				(fx (f x))
			)
			(/ (- fx (f y)) h)
		)
 	)
 )