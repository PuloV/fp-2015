#lang racket/base
(require racket/stream)

(define (factorial)
	(define (helper iter current)
		(stream-cons current (helper (+ iter 1)  (* current iter)) )
	)
	(helper 1 1)
)

(define f (factorial))
(stream-first f)
(stream-first (stream-rest f))
(stream-first (stream-rest (stream-rest f)))
(stream-first (stream-rest (stream-rest (stream-rest f))))
(stream-first (stream-rest (stream-rest (stream-rest (stream-rest f)))))
(stream-first (stream-rest (stream-rest (stream-rest (stream-rest (stream-rest f))))))
(stream-first (stream-rest (stream-rest (stream-rest (stream-rest (stream-rest (stream-rest f)))))))