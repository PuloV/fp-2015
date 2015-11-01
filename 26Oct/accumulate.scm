#lang racket/base

(define (accumulate comb null-val term a next b)
	(if (= a b)
	    (comb (term a) null-val)
	    (comb
	    	(term a)
		    (accumulate
		    	comb
		    	null-val
		    	term
		    	(next a)
		    	next
		    	b
		    )
	)
)

(accumulate
	+
	0
	(lambda (x) x)
	6
	(lambda (x) (+ x 1))
	9
)

(accumulate
	(lambda (x y)
		(if (even? x)
	    	(+ (* y 10) x)
	    	y)
	)
	0
	(lambda (x) x)
	1
	(lambda (x) (+ x 1))
	9
)



