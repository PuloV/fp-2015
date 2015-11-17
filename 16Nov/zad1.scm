#lang racket/base

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

(define L (list 1 2 3 4))

(filter odd? L)
(map (lambda (x) (/ x 2)) L)
(accumulate (lambda (nv x) (+ nv x )) L 0)
(display " Task 1 :")
(accumulate
	(lambda (nv x) (+ x nv) )
	(map
		(lambda (x) (+ (expt x 2)  1))
		(filter even? L)
	)
	0
)

(display " Task 1* :")
(let*
	(
		(filtered (filter even? L))
		(mapping-func (lambda (x) (+ (expt x 2)  1)))
		(mapped (map mapping-func filtered))
		(accumulater (lambda (nv x) (+ x nv) ))
	)
	(accumulate accumulater mapped 0)
)


(define (max-in-list L)
	(let*
		(
			(first-el (car L))
			(tail (cdr L))
			(comb
				(lambda (x y)
					(if (> x y)
			    	x
			    	y)
				)
			)
		)
		(accumulate
			comb
			tail
			first-el
		)
	)
)

(define L1 (list
		'(8 11 89)
		'(3 101 74)
		'(6 105 0)
	)
)
(display "max-in-list: ")
(max-in-list (map max-in-list L1))















