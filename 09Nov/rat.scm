#lang racket/base

(define (make-rat top bot)
	(cond ((and (< top 0) (< bot 0)) (cons (- top) (- bot)))
	 	  ((and (> top 0) (> bot 0)) (cons  top  bot))
	        (
	        	(or
	        		(and (< top 0) (> bot 0))
	        		(and (> top 0) (< bot 0))
	        	)
	    		(cons (- (abs top))  (abs bot))
	    	)
	    	((and (= top 0) (> (abs bot) 0)) (cons 0 (abs bot)))
	    	(else #f)
	)
)

(define (numer-rat R) (car R))
(define (denom-rat R) (cdr R))

(define (NOD X Y)
  (cond ((= X Y) X)
        ((< X Y) (NOD X (- Y X)))
        (else (NOD (- X Y) Y))
  	)
)

(define (sum-rat R1 R2)
	(let (
			(top (+
					(* (numer-rat R1) (denom-rat R2))
					(* (numer-rat R2) (denom-rat R1))
				)
			)
			(bot (* (denom-rat R1) (denom-rat R2)))
		)
		(define n (if (or (= top 0) (= bot 0)) 1 (NOD top bot)))
		(make-rat (/ top n) (/ bot n))
	)
)

(define (subt-rat R1 R2)
	(let (
			(new-top (- (numer-rat R2)))
			(new-bot (denom-rat R2))
		)
		(sum-rat R1 (make-rat new-top new-bot))
	)
)

(define (multi-rat R1 R2)
	(let (
			(new-top (* (numer-rat R1) (numer-rat R2)))
			(new-bot (* (denom-rat R1) (denom-rat R2)))
		)
		(make-rat new-top new-bot)
	)
)

(define A (make-rat 2 3) )
(define B (make-rat 1 3) )
(sum-rat A A)
(sum-rat A B)
(subt-rat A B)
(subt-rat A A)
(multi-rat A A)