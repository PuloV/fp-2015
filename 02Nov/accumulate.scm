#lang racket/base

(provide accumulate)

(define (accumulate comb null-val term a next b)
	(define (helper iter result)
		(if (> iter b)
		    result
		    (helper
		    	(next iter)
		    	(comb
		    		(term iter)
		    		result
		    	)
		    )
		)
	)
	(helper a null-val)
)