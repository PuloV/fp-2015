#lang scheme

(define (curve x y)
  (and
  	(> x 0)
  	(<
  		(+ (* x x) (* y y))
  		(* 2 2)
  	)
  )
)
; the top side of triangle
(define (f x)
	(+ (/ (* 2 x) 3) 2)
)

; the bottom side of triangle
(define (f1 x)
 	(- (* (/ (-2) 3) x) 2)
)

(define (triTop x y)
  (and
  	(< x 0)
  	(> y 0)
  	(< y (f x))
  )
)

(define (triBot x y)
  (and
  	(> x 0)
  	(< y 0)
  	(> y (f1 x))
  )
)

(define (center x y)
  (and
  	(= x 0)
  	(= y 0)
  )
)

(define (inFigure x y)
  (or
  	(curve x y)
  	(triTop x y)
  	(triBot x y)
  	(center x y)
  )
)