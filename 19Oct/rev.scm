#lang racket/base

(define (rev n)
	(define (helper iter result)
		(if (= iter 0)
		    result
		    (helper
		    	(quotient iter 10 )
		    	(+
		    		(* result 10)
		    		(remainder iter 10)
		    	)
		    )
		)
	)

	(cond ((< n 0) (- (rev (- n))))
	      ((helper n 0))
	)
)