#lang racket/base
(require racket/stream)

(define (digits)
	(define (helper iter)
		(stream-cons iter (helper (+ iter 1) ) )
	)
	(helper 1 )
)

(define f (digits))
(stream-first f)
(stream-first (stream-rest f))
(stream-first (stream-rest (stream-rest f)))
(stream-first (stream-rest (stream-rest (stream-rest f))))
(stream-first (stream-rest (stream-rest (stream-rest (stream-rest f)))))
(stream-first (stream-rest (stream-rest (stream-rest (stream-rest (stream-rest f))))))
(stream-first (stream-rest (stream-rest (stream-rest (stream-rest (stream-rest (stream-rest f)))))))