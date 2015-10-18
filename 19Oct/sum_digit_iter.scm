#lang racket/base

(define (digit-sum-itr x)
	(define (helper iter result)
	  (if (<= iter 9)
	      (+ iter result)
	      (helper
	      	(quotient iter 10)
	      	(+
	      		result
	      		(remainder iter 10 )
	      	)
	      )
	  )
	)
	(helper x 0)
)