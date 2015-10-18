#lang racket/base

(define (power-itr x y)
	(define (helper iter result)
		(if (= iter 0)
		    result
			(helper (- iter 1) (* result x))
		)
	)
	(cond ((= y 0) 1)
	      ((< y 0) (/ 1 (helper (- y) 1)))
	      ((> y 0) (helper y 1))
	)
)