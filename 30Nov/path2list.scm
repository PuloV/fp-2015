#lang racket/base


(require (file "graph.scm"))

(define (path->list x y graph)
    (if (path? x y graph)
        (list x y)
        (let*
            (
                (path-from-x
                    (filter
                        (lambda (p) (eq? x (car p)))
                        (graph-paths graph)
                    )
                )
                (nodes (map cadr path-from-x))
                (new-graph (remove-node x graph))
                (path-to-y (lambda (node)
                    (let
                        (
                            (path (path->list node y new-graph))
                        )
                        (if (null? path)
                            '()
                            (cons x path)
                        )
                    )
                ))
            )
            (if (null? nodes)
                '()
                (foldr
                    (lambda (x y)
                        (cond
                            ((and (> (length x) 0) (> (length y) 0) (< (length y) (length x))) y )
                            ((and (= (length x) 0) (> (length y) 0)) y)
                            (else x)
                        )
                    )
                    '()
                    (map
                        path-to-y
                        nodes
                    )
                )
            )
        )
    )
)