#lang racket/base


(require (file "graph.scm"))

(define (short-way x y G)
	(define MAX (+ (length (graph-paths G)) 1))
	(define (helper x y graph)
		(if (path? x y graph)
		    1
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
		    		(path-to-y (lambda (node) (+ (helper node y new-graph) 1)))
		    	)
		    	(if (empty? nodes)
		    	    MAX
		    	    (foldr
		    	    	(lambda (x y) (min x.y))
		    	    	MAX
		    	    	(map
		    	    		path-to-y
		    	    		nodes
		    	    	)
		    	    )
		    	)
		    )
		)
	)
	(define result (helper x y G))
	(if (>= result MAX)
	    #f
	    result
	)
)