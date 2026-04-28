(print '---section-1-arithmetic---)

(define (cddr x) (cdr (cdr x)))

(define a (+ 1 2))
(print a)

(define b (* 4 5))
(print b)

(print (+ a b))
(print (- b a))
(print (/ 100 4))

(print (> b a))
(print (< a b))

(define (square x) (* x x))
(print (square 7))

(print '---section-2-factorial---)

(define (fact n)
  (if (< n 2)
      1
      (* n (fact (- n 1)))))
(print (fact 5))
(print (fact 10))

(print '---section-3-fibonacci---)

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))
(print (fib 10))
(print (fib 15))

(print '---section-4-predicates---)

(print (number? 42))
(print (number? 'hello))
(print (symbol? 'hello))
(print (symbol? 42))
(print (pair? (cons 1 2)))
(print (pair? 'hello))
(print (null? ()))
(print (null? 7))
(print (not ()))
(print (not 42))
(print (eq? 'x 'x))
(print (eq? 'x 'y))
(print (eqv? 3.0 3.0))
(print (eqv? 3.0 4.0))

(print '---section-5-lists---)

(define ls (cons 1 (cons 2 (cons 3 ()))))
(print (car ls))
(print (car (cdr ls)))
(print (cadr ls))

(set-car! ls 10)
(print (car ls))
(set-cdr! (cdr ls) (cons 42 ()))
(print (caddr ls))

(print (copy-list ls))

(define alist (list (cons 'p 100) (cons 'q 200)))
(print (cdr (assq 'p alist)))
(print (cdr (assq 'q alist)))

(print '---section-6-higher-order---)

(define (twice f x) (f (f x)))
(print (twice square 2))

(define (my-map f l)
  (if (null? l)
      ()
      (cons (f (car l)) (my-map f (cdr l)))))
(print (my-map square (list 1 2 3 4 5)))

(define (my-reduce f init l)
  (if (null? l)
      init
      (my-reduce f (f init (car l)) (cdr l))))
(print (my-reduce + 0 (list 1 2 3 4 5)))

(print '---section-7-closures---)

(define (make-counter)
  (let ((n 0))
    (lambda () (set! n (+ n 1)) n)))
(define c1 (make-counter))
(define c2 (make-counter))
(print (c1))
(print (c1))
(print (c2))

(print '---section-8-let---)

(define (let-test x)
  (let ((y (+ x 1))
        (z (* x 2)))
    (+ y z)))
(print (let-test 5))

(print '---section-9-quote---)

(print ''hello)
(print (quote a))
(print (null? (quote ())))

(print '---section-10-macros---)

(define (when-macro form)
  (replace form
    (list 'if (cadr form)
          (cons 'begin (cddr form))
          '())))
(define when 'when-macro)

(define z 0)
(when (> (square 3) 5)
  (set! z 99))
(print z)
(when (< z 50)
  (set! z -1))
(print z)

(print '---section-11-or-and---)

(print (or () () 42 ()))
(print (or () () ()))
(print (and 1 2 3))
(print (and 1 () 3))

(print '---section-12-env---)

(print (symbol-bound? 'car ()))
(print (symbol-bound? 'no-such-thing ()))
(print (symbol-value 'car ()))
(print (symbol? (symbol-value 'car ())))

(print '---section-13-eval---)

(print (eval (quote (+ 1 2)) ()))
(print (eval (list '+ 3 4) ()))

(print '---section-14-gc---)

(gc-status)
(gc-status ())
(gc-status 1)

(print '---section-15-streams---)

(define s (enumerate-interval 1 5))
(print (head s))
(print (head (tail s)))
(print-stream-elements (enumerate-interval 10 13))

(print '---section-16-oblist---)

(print (pair? (oblist)))
(print (symbol? (car (oblist))))

(print '---section-17-read---)

(print 'done)

(print '---section-18-standard-fib---)

(print (standard-fib 10))
(print (standard-fib 15))

(print 'all-tests-complete)
