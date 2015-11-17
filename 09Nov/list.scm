#lang racket/base

(define L (list 1 2 3 4 5 6 7 8 9))

L

(car L)
(cdr L)

(display "cdr cdr \n")
(cdr (cdr L))
(cddr L)

(display "cdr car \n")
(car (cdr L))
(cadr L)

(display "cdr cdr car \n")
(car (cdr (cdr L)))
(caddr L)


(display "Adding elements to list\n")
(let (
		(L1 (cons 0 L))
		(L2 (cons L 10))
	)
	(display L1)
	(newline)
	(display L2)
	(newline)

)

(null? L)
(null? (list))
(null? '())