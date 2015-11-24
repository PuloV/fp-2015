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

(define (max-num tree)
	(if (empty? tree)
	    0
	    (let*
	    	(
	    		(left-num (max-num (left-tree tree)))
	    		(right-num (max-num (right-tree tree)))
	    		(max-lr (max left-num right-num))
	    		(max-lr*10 (* max-lr 10))
	    		(tree-root (root tree))
	    		(max+root (+ max-lr*10 tree-root))
	    	)
	    	max+root
	    )
	)
)

(max-num T)