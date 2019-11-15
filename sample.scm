; #t => True
; #f => False

(define (member a lis)
    (cond
        ((null? lis) #f)
        ((eq? a (car lis)) #t)
        (else (member a (cdr lis)))
    )
)

(display "member function: ") (newline)
(display (member 5 '(12 4 6 10))) (newline)

(define (sum ls)
    (if (null? ls) 
        0
        (+ (car ls) (sum (cdr ls)))
    )
)

(display "sum function: ") (newline)
(display (sum '(5 2 3 1))) (newline)

(define (zeros ls count)
    ; Similar to switch statement
    (cond
        ((null? ls) count)
        ((zero? (car ls)) (zeros (cdr ls) (+ count 1)))
        (else (zeros (cdr ls) count))
    )
)

(display "zeros function: ") (newline)
(display (zeros '(5 2 0 3 0) 0)) (newline)

(define (pow m n)
    (if (= n 0) 1 (* m (pow m (- n 1))))
)

(display "Pow function: ") (newline)
(display (pow 3 2)) (newline)

(define (countsymbols lis)
    (if (null? lis) 0
        (+ (if (symbol? (car lis)) 1 0) (countsymbols (cdr lis)))
    )
)

(display "countsymbols function: ") (newline)
(display (countsymbols '(1 2 a 3 b))) (newline)

; Using lambda function as parameter
(define factorial(lambda (n)
    (if (< n 2)
        1
        (* n (factorial (- n 1)))
    )
))

(display "factorial function: ") (newline)
(display (factorial 5)) (newline)

(define (tail_factorial n w)
    (if (zero? n)
        w
        (tail_factorial (- n 1) (* w n))
    )
)

(display "tail_factorial function: ") (newline)
(display (tail_factorial 5 1)) (newline)

; Installing packages:
; raco pkg install <pkg-name>
