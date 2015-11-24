#lang racket/base

(require (file "btree.scm"))

(define T5 (make-tree 5 ET ET))
(define T8 (make-tree 8 ET ET))
(define T6 (make-tree 6 T8 ET))
(define T3 (make-tree 3 T5 T6))

(define T1 (make-tree 1 ET ET))
(define T2 (make-tree 2 ET ET))
(define T7 (make-tree 7 T2 T1))
(define T9 (make-tree 9 ET T7))

(define T (make-tree 1 T3 T9))

(define (tree-height tree)
	(cond
		((null? tree) 0)
		((leaf? tree) 1)
	    (else (+
	    		(max
	    			(tree-height (left-tree tree))
	    			(tree-height (right-tree tree))
	    		)
	    		1
	    	)
		)
	)
)

(tree-height T)