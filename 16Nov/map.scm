(define (map f L)
	(define (helper current-list result)
		(if (null? current-list)
				result
			    (helper
			    	(cdr current-list)
			       	(cons (f (car current-list)) result)
			    )

		)
	)

	(reverse (helper L '()))
)