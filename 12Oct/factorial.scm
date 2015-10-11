#lang scheme

(define (fact x)
	(if (= x 1)
	    1
	    (* 	x
	    	(fact (- x 1))
	    )
	)
)