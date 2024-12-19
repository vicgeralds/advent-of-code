#lang racket

(define (read-garden-plots)
  (let ([line (read-line)])
    (if (string? line)
        (cons (list->vector (string->list line)) (read-garden-plots))
        (list))))

(define right (cons 0 1))
(define down (cons 1 0))
(define left (cons 0 -1))
(define up (cons -1 0))

(define (calc-price region)
  (* (length region) (apply + region)))

"What is the total price of fencing all regions on your map?"

(let* ([plots-to-walk (list->vector (read-garden-plots))]
       [garden-plots (vector-map vector->immutable-vector plots-to-walk)]
       [height (vector-length garden-plots)]
       [width (vector-length (vector-ref garden-plots 0))])

  (define (get-directions row col)
    (define (inside-map? direction)
      (match direction
        [(cons i j)
         (and (>= (+ i row) 0)
              (>= (+ j col) 0)
              (< (+ i row) height)
              (< (+ j col) width))]))
    (filter inside-map? (list right down left up)))

  (define (get-plant row col)
    (vector-ref (vector-ref garden-plots row) col))

  (define (count-fences plant row col)
    (vector-set! (vector-ref plots-to-walk row) col #\space)
    (define (unfenced? direction)
      (match direction
        [(cons i j) (equal? plant (get-plant (+ i row) (+ j col)))]))
    (let* ([unfenced-directions
            (filter unfenced? (get-directions row col))]
           [repeated-sides
            (+
             (if (member up unfenced-directions)
                 (+
                  (if (or (equal? 0 col)
                          (not (or (member left unfenced-directions)
                                   (equal? plant (get-plant (- row 1) (- col 1))))))
                      1 0)
                  (if (or (equal? width (+ 1 col))
                          (not (or (member right unfenced-directions)
                                   (equal? plant (get-plant (- row 1) (+ col 1))))))
                      1 0))
                 0)
             (if (member left unfenced-directions)
                 (+
                  (if (or (equal? 0 row)
                          (not (or (member up unfenced-directions)
                                   (equal? plant (get-plant (- row 1) (- col 1))))))
                      1 0)
                  (if (or (equal? height (+ 1 row))
                          (not (or (member down unfenced-directions)
                                   (equal? plant (get-plant (+ row 1) (- col 1))))))
                      1 0))
                 0))])
      (cons (- 4 (length unfenced-directions) repeated-sides)
            (apply append
                   (for/list ([direction unfenced-directions])
                     (match direction
                       [(cons i j) (find-region plant (+ i row) (+ j col))]))))))

  (define (find-region plant row col)
    (if (equal? plant (vector-ref (vector-ref plots-to-walk row) col))
        (count-fences plant row col)
        (list)))

  (for/sum [(row (range height))]
    (for/sum [(col (range width))]
      (calc-price (find-region (get-plant row col) row col)))))
