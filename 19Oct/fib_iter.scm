#lang racket/base

(define (fib-itr x)
	(define (helper iter prev curr)
		(if (= iter 1)
		    curr
		    (helper
		    	(- iter 1)
		    	curr
		    	(+ curr prev)
		    )
		)
	)
	(helper x 0 1)
)