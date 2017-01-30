
(in-package :bit-ops)

(as-bitwise-operations ()
  (full-adder-sum (subseq a 1)
                  (subseq b 1)
                  (half-adder-carry a b)))


(define-bitwise-operation multi-adder-sum (a b n)
  (if (zerop n)
      `(half-adder-sum ,a ,b)
      `(full-adder-sum (subseq ,a ,n)
                       (subseq ,b ,n)
                       (multi-adder-carry ,a ,b ,(1- n)))))


(define-bitwise-operation multi-adder-carry (a b n)
  (if (zerop n)
      `(half-adder-carry ,a ,b)
      `(full-adder-carry (subseq ,a ,n)
                         (subseq ,b ,n)
                         (multi-adder-carry ,a ,b ,(1- n)))))

(as-bitwise-operations ()
  (multi-adder-sum a b 5))


(as-bitwise-operations ()
  (ior (and a b)
       (and (not a) c)))
