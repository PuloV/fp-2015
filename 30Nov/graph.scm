#lang racket/base

(provide empty?)
(provide contains?)
(provide empty-graph)
(provide empty-graph?)
(provide make-graph)
(provide graph-nodes)
(provide graph-paths)
(provide node?)
(provide path?)
(provide insert-node)
(provide insert-path)
(provide remove-node)
(provide remove-path)

(define empty? null?)

(define (contains? i l)
  (if (empty? l) #f
      (or (equal? (car l) i) (contains? i (cdr l)))))

(define (empty-graph)
  (list '() '())
)

(define (empty-graph? graph)
  (and
  	(empty? (graph-paths graph) )
  	(empty? (graph-nodes graph) )
  )
)

(define (make-graph nodes paths)
  (list nodes paths)
)

(define (graph-nodes graph)
  (car graph)
)

(define (graph-paths graph)
	(cadr graph)
)

(define (node? node graph)
  (contains?
  	node
  	(graph-nodes graph)
  )
)

(define (path? x y graph)
  (let*
  	(
  		(xy (list x y))
  		(paths (graph-paths graph))
  	)
  	(contains? xy paths)
  )
)

(define (insert-node node graph)
	(let* (
			(old-nodes (graph-nodes graph))
			(new-nodes (cons node old-nodes))
			(paths (graph-paths graph))
		)
		(if (node? node graph)
		    graph
		    (make-graph new-nodes paths)
		)
	)
)

(define (insert-path x y graph)
	(let* (
			(nodes (graph-nodes graph))
			(paths (graph-paths graph))
			(new-paths (cons (list x y) paths))
		)
		(if (and (node? x graph) (node? y graph))
			(if (path? x y graph)
			    graph
			    (make-graph nodes new-paths)
			)
		    #f
		)
	)
)

(define (remove-node node graph)
	(let* (
			(old-nodes (graph-nodes graph))
			(new-nodes (filter
							(lambda (x) (not (eq? node x)))
							old-nodes
						)
			)
			(old-paths (graph-paths graph))
			(new-paths (filter
							(lambda (path)
								(not (or
										(eq? (cadr path) node)
										(eq? (car path) node)
								))
							)
							old-paths
						)
			)
		)
	  	(make-graph new-nodes new-paths)
	)
)

(define (remove-path x y graph)
	(let* (
			(nodes (graph-nodes graph))
			(old-paths (graph-paths graph))
			(new-paths (filter
							(lambda (path)
								(not (and
									(eq? (car path) x)
									(eq? (cadr path) y)
								))
							)
							old-paths
						)
			)
		)
	  	(make-graph nodes new-paths)
	)
)
