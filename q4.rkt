(define (mergesort lis)
    (if (= (length lis) 1)
        lis
        (merge 
            (mergesort (head lis (quotient (length lis) 2)))
            (mergesort (tail lis (- (length lis) (quotient (length lis) 2))))
        )
    )
)

; Returns head of the list of given len (O(N))
(define (head lis len)
    (if (zero? len)
        (list)
        (append (list (car lis)) (head (cdr lis) (- len 1)))
    )
)

; Returns tail of the lis for given length of tail (O(N))
(define (tail lis len)
    (auxtail lis (- (length lis) len))
)

(define (auxtail lis len)
    (if (zero? len)
        lis
        (auxtail (cdr lis) (- len 1))
    )
)

; Merges two sorted lists (O(N))
(define (merge head tail)
    (cond
        ((null? head)
            tail
        )
        ((null? tail)
            head
        )
        ((< (car head) (car tail))
            (append (list (car head)) (merge (cdr head) tail))
        )
        (else
            (append (list (car tail)) (merge head (cdr tail)))
        )
    )
)

; (display (mergesort '(2 3 1 5 4))) (newline)