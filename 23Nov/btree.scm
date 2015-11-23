#lang racket/base

(provide make-tree)
(define (make-tree root left right)
	(list root left right)
)

(provide root)
(define (root tree)
	(car tree)
)

(provide left-tree)
(define (left-tree tree)
	(cadr tree)
)

(provide right-tree)
(define (right-tree tree)
	(caddr tree)
)

(provide leaf?)
(define (leaf? tree)
	(and
		(null? (left-tree tree) )
		(null? (right-tree tree))
	)
)

(provide empty?)
(define (empty? tree)
	(null? tree)
)

(provide ET)
(define ET '())



