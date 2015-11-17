#lang racket/base

(define (length L)
	(define (helper iter l)
		(if (null? l)
		    iter
		    (helper (+ iter 1) (cdr l)))
	)
)