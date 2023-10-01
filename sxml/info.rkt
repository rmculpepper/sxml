#lang info

;; pkg info

(define collection "sxml")
(define deps
  '("base"
    "sxml-lib"))
(define build-deps
  '("scribble-lib"
    "racket-doc"))
(define implies '("sxml-lib"))
(define pkg-authors '(ryanc))

;; collection info

(define name "sxml")
(define categories '(xml))
(define scribblings
  '(("scribblings/sxml.scrbl" (multi-page))))
