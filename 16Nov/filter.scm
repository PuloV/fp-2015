(define (filter f L)
	(define (helper current-list result)
		(cond ((null? current-list) result)
		      (
		      	(f (car current-list))
		       	(helper
		       		(cdr current-list)
		       		(cons (car current-list) result)
		       	)
		       )
		      (else (helper (cdr current-list) result))
		)
	)

	(reverse (helper L '()))
)