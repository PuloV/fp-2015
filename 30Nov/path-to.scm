#lang racket/base


(require (file "graph.scm"))

(define (path-to? x y graph)
	(if (path? x y graph)
	    #t
	    (let*
	    	(
	    		(path-from-x
	    			(filter
	    				(lambda (path) (eq? x (car path)))
	    				(graph-paths graph)
	    			)
	    		)
	    		(nodes (map cadr path-from-x))
	    		(new-graph (remove-node x graph))
	    		(path-to-y (lambda (node) (path-to? node y new-graph)))
	    	)
	    	(if (empty? nodes)
	    	    #f
	    	    (foldr
	    	    	(lambda (x y) (or x y))
	    	    	#f
	    	    	(map
	    	    		path-to-y
	    	    		nodes
	    	    	)
	    	    )
	    	)
	    )
	)
)