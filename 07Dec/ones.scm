#lang racket/base

(require racket/stream)
(define ones (stream-cons 1
                          ones))

ones
(stream-first ones)
(stream-rest ones)
(stream-empty? ones)
(stream? ones)