(define (auxinfixToPostfix lis stk out)
    (if (null? lis)
        (append out stk)
        (if (number? (car lis))
            (auxinfixToPostfix (cdr lis) stk (append out (list (car lis))))
            (cond 
                ((or (char=? #\+ (car lis)) (char=? #\- (car lis)))
                    (auxinfixToPostfix (cdr lis) (list (car lis)) (append out stk))
                )
                (else 
                    (auxinfixToPostfix (cdr lis) (append (list (car lis)) stk) out)
                )
            )
        )
    )
)

(define (infixToPostfix lis)
    (auxinfixToPostfix lis '() '())
)

; (display (infixToPostfix '(1 #\+ 2 #\* 3 #\- 4))) (newline)