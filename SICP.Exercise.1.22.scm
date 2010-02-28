;;; Exercise 1.22

(define (even? x)
  (= (remainder x 2) 0))

;testing even?

(even? 4)  ; #t
(even? 76) ; #t
(even? 77) ; #f



(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  0)

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(timed-prime-test 1009)

(define (search-for-primes low high)
  (sfp-iter low high))

(define (sfp-iter low high)
  (cond ((> low high) 0)
        ((even? low) (sfp-iter (+ low 1) high))
        ((prime? low) (+ (sfp-iter (+ low 2) high)
                         (timed-prime-test low)))
        (else (sfp-iter (+ low 1) high))))

(search-for-primes 100000000 10000000000)
          


  


                   
;;testing

