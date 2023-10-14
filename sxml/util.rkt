#lang racket/base
(require racket/string)
(provide and-let*
         string-null?
         string-contains
         string-index
         string-index-right
         string-join
         string-concatenate/shared
         string-concatenate-reverse/shared
         srfi:string-prefix?
         srfi:string-prefix-ci?)

(define (string-null? s)
  (equal? s ""))

(define (string-contains str substr)
  (string-contains? str substr))

(define (string-index str findc)
  (for/first ([c (in-string str)]
              [i (in-naturals)]
              #:when (eqv? c findc))
    i))

(define (string-index-right str findc)
  (for/last ([c (in-string str)]
             [i (in-naturals)]
             #:when (eqv? c findc))
    i))

(define (string-concatenate-reverse/shared strs)
  (apply string-append (reverse strs)))

(define (string-concatenate/shared strs)
  (apply string-append strs))

(define (srfi:string-prefix? prefix str)
  (string-prefix? str prefix))

(define (srfi:string-prefix-ci? prefix str)
  (and (>= (string-length str) (string-length prefix))
       (string-ci=? (substring str 0 (string-length prefix)) prefix)))

(define-syntax and-let*
  (syntax-rules ()
    [(_ () . body)
     (let () . body)]
    [(_ ([x rhs] . bindings) . body)
     (let ([x rhs])
       (and x (and-let* bindings . body)))]))
