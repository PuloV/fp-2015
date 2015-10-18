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