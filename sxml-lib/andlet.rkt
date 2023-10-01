#lang racket/base
(provide and-let*)

(define-syntax and-let*
  (syntax-rules ()
    [(_ () . body)
     (let () . body)]
    [(_ ([x rhs] . binds) . body)
     (let ([x rhs])
       (and x (and-let* binds . body)))]))
