(define (accumulate f L nv)
	(define (helper current-list current-value)
		(if (null? current-list)
				current-value
			    (helper
			    	(cdr current-list)
			       	(f current-value (car current-list))
			    )

		)
	)

	(helper L nv)
)