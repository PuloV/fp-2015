#lang scheme

(define (quadrants x y)
  (cond ((and (> x 0) (> y 0)) "TOP RIGHT")
        ((and (< x 0) (> y 0)) "TOP LEFT")
        ((and (< x 0) (> y 0)) "BOTTOM LEFT")
        ((and (< x 0) (< y 0)) "BOTTOM RIGHT")
        ("CENTER (0,0)")
    )
)