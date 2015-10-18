#lang scheme

(define (digitCount x)
	(if (>= x 9)
	    1
	    (+
	    	1
	    	(digitCount (quotient x 10))
	    )
	)
)

(define (digitCountItr x)
	(define (helper iter result)
	  (if (>= iter 9)
	      (+ result 1)
	      (helper (quotient iter 10) (+ result 1))
	  )
	)
	(helper x 0)
)