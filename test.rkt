#lang racket

(struct foo (a b)
  #:methods gen:equal+hash
  [(define (equal-proc f1 f2 recursive-equal?)
     (equal? (foo-a f1) (foo-a f2)))

   (define (hash-proc f recursive-equal-hash)
     (foo-a f))

   (define (hash2-proc f recursive-equal-hash)
     (bitwise-xor (foo-a f)))])

(require rackunit)

(check-equal? (foo 1 2) (foo 1 3))

