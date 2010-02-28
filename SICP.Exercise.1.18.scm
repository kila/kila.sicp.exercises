;;; Exercise 1.18

;; note: this is actually the same code
;; for my exercise 1.17 as I wrote it
;; as an iterative process.

(define (is-int? number)
  (= (remainder number 1) 0))
;; remainder only takes ints anyway
;; so error is thrown on try

(define (even? number)
  (= (remainder number 2) 0))

(define (double number)
  (if (is-int? number)
      (* 2 number)
      0))

(define (halve number)
  (if (even? number)
      (/ number 2)
      0))
;; I need to learn how to exit these functions and
;; throw an error, not just put in 0s

(define (mult-iter small large stored)
  (cond ((= small 0) stored)
        ((even? small) (mult-iter (halve small)
                                  (double large)
                                  stored))
        (else (mult-iter (- small 1)
                         large
                         (+ stored large)))))

(define (multiply a b)
;; check to see which is larger
;; which i think will make it faster
  (if (< a b)
      (mult-iter a b 0)
      (mult-iter b a 0)))

;;testing
(multiply 0 1)
(multiply 8 8)
(multiply 36 74)
(multiply 3 2)
