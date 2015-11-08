#lang racket/base

(require (file "accumulate.scm"))

(define (result-gen start end op step )
  (let (
  		(result
	  		(accumulate
			  	op
			  	(if (or (eq? op +) (eq? op -)) 0 1)
			  	(lambda (x)
			  		(display x)
			  		(cond ((> (+ x step) end) (display ""))
			  			  ((eq? op  +) (display "+"))
			  		      ((eq? op  -) (display "-"))
			  		      ((eq? op  *) (display "*"))
			  		      ((eq? op  /) (display "/"))
			  		)
			  	x)
			  	start
			  	(lambda (x) (+ x step))
			  	end
			)
	  	)
  	)

	(display " = ")
	(display result)
	(newline)
	result

  )
)

(result-gen 0 9 + 3)
(result-gen 1 3 * 1)