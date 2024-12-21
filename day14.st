Object subclass: #Robot.
Robot instanceVariableNames: 'p v'.

Robot class extend [
    new: line [
        | r points |
        r := super new.
        points := line substrings.
        r position: (Robot parse: (points first)).
        r velocity: (Robot parse: (points last)).
        ^r
    ]
    parse: s [
        | parts x y |
        parts := s substrings: ','.
        x := (parts first substrings: '=') last asNumber.
        y := parts last asNumber.
        ^x @ y
    ]
]

Robot extend [
    position: value [
        p := value
    ]
    velocity: value [
        v := value
    ]
    move [
        | x y |
        x := p x + v x \\ 101.
        y := p y + v y \\ 103.
        self position: x @ y
    ]
    quadrant [
        | x y halfWidth halfHeight |
        x := p x.
        y := p y.
        halfWidth := 101 // 2.
        halfHeight := 103 // 2.
        ^(x = halfWidth or: [y = halfHeight]) ifFalse: [
            x // (halfWidth + 1) * 2 + (y // (halfHeight + 1)) + 1
        ]
    ]
]

| robots counts |

robots := OrderedCollection new.
counts := Array new: 4. 
counts at: 1 put: 0.
counts at: 2 put: 0.
counts at: 3 put: 0.
counts at: 4 put: 0.

stdin linesDo: [:line |
    robots add: (Robot new: line)
].

robots do: [:r |
    1 to: 100 do: [:i | r move]
].

robots do: [:r |
    | i |
    i := r quadrant.
    i isNil ifFalse: [
        counts at: i put: (1 + (counts at: i))
    ]
].

'What will the safety factor be after exactly 100 seconds have elapsed?' printNl.

((counts at: 1) * (counts at: 2) * (counts at: 3) * (counts at: 4)) printNl.
