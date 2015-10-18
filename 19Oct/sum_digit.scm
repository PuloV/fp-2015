#lang racket/base

(define (digit-sum x)
	(if (<= x 9)
	    x
	    (+
	    	(remainder x 10 )
	    	(digit-sum (quotient x 10))
	    )
	)
)
