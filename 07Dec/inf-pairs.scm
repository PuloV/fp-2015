#lang racket/base


(require racket/stream)

(define (inf-pairs)
	(define (helper curr-row column row reverse?)
		(cond
			((= column 1 ) (helper (+ curr-row 1) 1 (+ curr-row 1) #f ))
			(reverse?  (stream-cons (cons row column) (helper curr-row column (- row 1) #t)))
		    (else (stream-cons (cons row column) (helper curr-row (+ column 1) curr-row #f )))
		)
	)
	(helper 1 1 1 #f)
)

(stream-ref (inf-pairs) 0)
(stream-ref (inf-pairs) 1)
(stream-ref (inf-pairs) 2)
(stream-ref (inf-pairs) 3)
(stream-ref (inf-pairs) 4)
(stream-ref (inf-pairs) 5)
(stream-ref (inf-pairs) 6)
(stream-ref (inf-pairs) 7)
(stream-ref (inf-pairs) 8)
(stream-ref (inf-pairs) 9)
(stream-ref (inf-pairs) 10)
(stream-ref (inf-pairs) 11)
(stream-ref (inf-pairs) 12)
(stream-ref (inf-pairs) 13)
(stream-ref (inf-pairs) 14)
(stream-ref (inf-pairs) 15)
(stream-ref (inf-pairs) 16)
(stream-ref (inf-pairs) 17)
(stream-ref (inf-pairs) 18)
(stream-ref (inf-pairs) 19)