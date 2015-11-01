#lang racket/base

(define (power x y)
	(cond ((= y 0) 1)
	      ((< y 0)
	      	(/
	      	 	1
	      		(power x (- y))
	      	)
	      )
	      ((> y 0)
	      	(*
	      		x
	      		(power x (- y 1))
	      	)
	      )
	)
)

(define (digitCount x)
	(if (<= x 9)
	    1
	    (+
	    	1
	    	(digitCount (quotient x 10))
	    )
	)
)

(define (automorph? x)
	(display (digitCount x))
	(=
		x
		(remainder
				(* x x)
				(power 10 (digitCount x))
		)
	)
)