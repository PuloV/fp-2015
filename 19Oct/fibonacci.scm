#lang racket/base

(define (fibonacci n)
	(cond ((= n 1) 1)
	      ((= n 2) 1)
	      ((< n 1) #f)
	      (
	      	(+
	      		(fibonacci (- n 1))
	      		(fibonacci (- n 2))
	      	)
	      )
	)
)