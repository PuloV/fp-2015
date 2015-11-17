#lang racket/base

(define pair (cons 56 98))

pair

(car pair)
(cdr pair)

(define pair-of-pairs (cons pair pair) )

pair-of-pairs