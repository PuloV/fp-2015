#lang scheme

(define (fact x)
	(if (= x 1)
	    1
	    (* 	x
	    	(fact (- x 1))
	    )
	)
)

(define (f2 x)
	(define (helper iter result)
		(if (<= iter 0)
		    result
		    (helper (- iter 1) (* result iter))
		)
	)
	(helper x 1)
)