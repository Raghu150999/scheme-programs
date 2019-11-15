(include "q5.rkt")

(define (printPathsRecursive tree)
    (for ((path (getPaths tree)))
        (printpath path)
    )
)

; Returns a list of paths from the root node to all the leaves in the subtree
(define (getPaths tree)
    (if (= (length tree) 1)
        (list tree)
        (combine (getPathsmany (cdr tree)) (car tree))
    )
)

; Calls getPaths for all child nodes
(define (getPathsmany lis)
    (if (null? lis)
        (list)
        (append (getPaths (car lis)) (getPathsmany (cdr lis)))
    )
)

; Appends current node to top of all paths
(define (combine lis val)
    (if (null? lis)
        (list)
        (append (list (append (list val) (car lis))) (combine (cdr lis) val))
    )
)

(define (printPathsTailRecursive tree)
    (auxprintPathsTailRecursive tree (list))
)

(define (auxprintPathsTailRecursive tree path)
    (if (= (length tree) 1)
        ; After reaching leaf print the path
        (printpath (append path (list (car tree))))
        (for ((child (cdr tree)))
            (auxprintPathsTailRecursive child (append path (list (car tree))))
        )
    )
)

; Helper function for printing the path present in the list
(define (printpath lis)
    (if (null? lis)
        (newline)
        (begin
            (display (car lis))
            (display #\space)
            (printpath (cdr lis))
        )
    )
)

(printPathsRecursive
    (makeTree 1 
        (makeTree 2
            (makeTree 6)
            (makeTree 7
                (makeTree 8)
            )
        )
        (makeTree 3
            (makeTree 9 
                (makeTree 10) 
                (makeTree 11)
            )
        )
        (makeTree 4)
        (makeTree 5)
    )
)