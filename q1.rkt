(define (sumUpRecursive lis)
    (if (null? lis)
        0
        (+ (car lis) (sumUpRecursive (cdr lis)))
    )
)

; (display (sumUpRecursive '(1 2 3))) (newline)

(define (sumUpTailRecursion lis val)
    (if (null? lis)
        val
        (sumUpTailRecursion (cdr lis) (+ val (car lis)))
    )
)

; (display (sumUpTailRecursion '(1 2 3) 0)) (newline)