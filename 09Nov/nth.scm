#lang racket/base

(define (nth L n)
	(define (helper iter lst)
		(cond ((= iter 0) (car lst))
			((null? lst) #f)
		    (else (helper (- iter 1) (cdr lst)))
		)
	)
	(helper n L)
)
