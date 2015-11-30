#lang racket/base
(require (file "graph.scm"))

(define EG (empty-graph))

(define g1 (insert-node 1 EG ))
(define g12 (insert-node 2 g1 ))
(define g123 (insert-node 3 g12 ))
(define g1234 (insert-node 4 g123 ))
(define g12345 (insert-node 5 g1234 ))
(define g123456 (insert-node 6 g12345 ))

(define g1p
	(insert-path 1 2
		(insert-path 1 3
			(insert-path 1 6
				g123456
			)
		)
	)
)

(define g2p
	(insert-path 2 4
		(insert-path 2 3
			(insert-path 2 5
				g1p
			)
		)
	)
)

(define g3p
	(insert-path 3 6 g2p)
)

(define g4p
	(insert-path 4 5
		(insert-path 4 3
			g3p
		)
	)
)

(define GRAPH
	(insert-path 6 1
		(insert-path 6 4
			g3p
		)
	)
)

(display "Empty graph and empty-graph?")(newline)
EG
(empty-graph? EG)

(display "GRAPH")(newline)
GRAPH

(display "Check for nodes 1,8")(newline)
(node? 1 GRAPH)
(node? 8 GRAPH)

(display "Check for ribs <1,2> <2,1> <6,4> <10,0>")(newline)
(path? 1 2 GRAPH)
(path? 2 1 GRAPH)
(path? 6 4 GRAPH)
(path? 10 0 GRAPH)

(display "Remove node 6")(newline)
(let*
	(
		(g-6 (remove-node 6 GRAPH))
	)

	(display "The new graph")(newline)
	(display g-6)(newline)

	(display "Check the new graph for nodes 1,6")(newline)
	(display (node? 1 g-6))(newline)
	(display (node? 6 g-6))(newline)

	(display "Check the new graph for ribs <1,2> <6,4>")(newline)
	(display (path? 1 2 g-6))(newline)
	(display (path? 6 4 g-6))(newline)


)

(display "Remove rib <2,5>")(newline)
(let*
	(
		(g-25 (remove-path 2 5 GRAPH))
	)

	(display "The new graph")(newline)
	(display g-25)(newline)

	(display "Check the new graph for nodes 2,5")(newline)
	(display (node? 2 g-25))(newline)
	(display (node? 2 g-25))(newline)

	(display "Check the old graph for ribs <2,5> <6,4>")(newline)
	(display (path? 2 5 GRAPH))(newline)
	(display (path? 6 4 GRAPH))(newline)

	(display "Check the new graph for ribs <2,5> <6,4>")(newline)
	(display (path? 2 5 g-25))(newline)
	(display (path? 6 4 g-25))(newline)


)