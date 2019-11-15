(include "q2.rkt")

(define (auxevalPostfix lis stk)
    (if (null? lis)
        (car stk)
        (cond
            ((number? (car lis))
                (auxevalPostfix (cdr lis) (append (list (car lis)) stk))
            )
            (else
                (auxevalPostfix (cdr lis)
                    (append (list (popeval (car lis) stk)) (cdr (cdr stk)))
                )
            )
        )
    )
)

(define (operate op a b)
    (cond
        ((char=? #\+ op)
            (+ a b)
        )
        ((char=? #\- op)
            (- a b)
        )
        (else
            (* a b)
        )
    )
)

(define (popeval op stk)
    (operate op (car (cdr stk)) (car stk))
)

(define (evalPostfixExpr lis)
    (auxevalPostfix lis '())
)

; (display (evalPostfixExpr (infixToPostfix '(1 #\+ 2 #\* 3 #\- 4 #\* 2)))) (newline)