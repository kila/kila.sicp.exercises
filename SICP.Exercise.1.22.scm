;;; Exercise 1.22

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

(define (report-prime n elapsed-time) ;modified
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)  ;modified
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (timed-prime-test n)   ;moved if prime? from start-prime-est
  (if (prime? n)
      (start-prime-test n (runtime))))

(define (search-for-primes low high)
  (if (< low high)
      (sfp-iter low high)
      (display "Invalid Input")))

(define (sfp-iter low high)
  (timed-prime-test low)
  (cond ((> low high) "Finished")
        ((even? low) (sfp-iter (+ low 1) high)) ;start with odd
        (else (sfp-iter (+ low 2) high))))      ;check only odd

(search-for-primes 1000000000 1000010000)