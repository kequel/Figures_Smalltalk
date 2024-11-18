"Definition of the Polygon class"
Object subclass: Polygon [
    | vertices name scale |  

    Polygon class >> initialize_list: vertexList name: newName [
        "Constructor for the Polygon object"
        ^self new initialize_list: vertexList name: newName.
    ]

    Polygon >> initialize_list: vertexList name: newName [
        name := newName.
        vertices := vertexList.
        scale := 1.  "default scale is 1"
    ]

    Polygon >> initialize: vertexCount name: newName [
        name := newName.
        vertices := Array new: vertexCount.
        vertices at: 1 put: 0@0.
        scale := 1.  "default scale is 1"
    ]

    Polygon >> name [
        ^name.
    ]

    Polygon >> name: newName [
        name := newName.
    ]

    Polygon >> scale [
        ^scale.
    ]

    Polygon >> scale: newScale [
        scale := newScale.
    ]

    Polygon >> print [
        Transcript show: 'Name: ', name; cr.
        (scale ~= 1) ifTrue: [
            Transcript show: 'The figure has been scaled by factor ', scale printString; cr.
        ].
        1 to: vertices size do: [:i |
            Transcript show: 'Vertex ', i printString, ': ', (vertices at: i) printString; cr].
        Transcript show: 'Area = ', self area printString; cr; cr.
    ]

    Polygon >> scaleBy: scaleFactor [
        | newVertices newObject |
        Transcript show: 'Scaling the sides of figure: ', self name, ' by factor ', scaleFactor printString; cr.
        newVertices := Array new: vertices size.
        1 to: vertices size do: [:i |
            newVertices at: i put: (((vertices at: i) x * scaleFactor) @ ((vertices at: i) y * scaleFactor))].
        newObject := (self class new) initialize_list: newVertices name: self name.
        newObject scale: self scale * scaleFactor.  
        ^newObject.
    ]
]

"Definition of the Square class"
Polygon subclass: Square [
    Square class >> initialize: side [
        ^self new initialize: side.
    ]

    Square >> initialize: side [
        super initialize: 4 name: 'Square'.
        vertices at: 2 put: side@0.
        vertices at: 3 put: side@side.
        vertices at: 4 put: 0@side.
    ]

    Square >> area [
        ^((vertices at: 2) x squared) rounded.
    ]

    Square >> = anotherSquare [
        ^(self area) = (anotherSquare area).
    ]

    Square >> + figure [
        | areaSum |
        areaSum := self area + figure area.
        areaSum := areaSum rounded.
        ^(Square new) initialize: areaSum sqrt.
    ]
]

"Definition of the RightTrapezoid class"
Polygon subclass: RightTrapezoid [
    RightTrapezoid class >> initialize: base base1: base1 height: height [
        ^self new initialize: base base1: base1 height: height.
    ]

    RightTrapezoid >> initialize: base base1: base1 height: height [
        | list |
        list := Array new: 4.
        list at: 1 put: 0@0.
        list at: 2 put: base@0.
        list at: 3 put: base1@height.
        list at: 4 put: 0@height.

        vertices ifNil: [vertices := list].
        super initialize_list: list name: 'RightTrapezoid'.
    ]

    RightTrapezoid >> vertices [
        ^vertices
    ]

    RightTrapezoid >> area [
        | base base1 height |
        base := (vertices at: 2) x.
        base1 := (vertices at: 3) x.
        height := (vertices at: 3) y.
        ^((((base + base1) * height) / 2) rounded).
    ]

    RightTrapezoid >> = anotherTrapezoid [
        | selfSmall selfLarge selfHeight anotherSmall anotherLarge anotherHeight |
        (self class = anotherTrapezoid class) ifFalse: [^false].

        "Bases sorted as larger and smaller for self"
        ((self vertices at: 2) x) <= ((self vertices at: 3) x)
            ifTrue: [
                selfSmall := (self vertices at: 2) x.
                selfLarge := (self vertices at: 3) x.
            ] ifFalse: [
                selfSmall := (self vertices at: 3) x.
                selfLarge := (self vertices at: 2) x.
            ].
        selfHeight := (self vertices at: 3) y.

        "Bases sorted as larger and smaller for another trapezoid"
        ((anotherTrapezoid vertices at: 2) x) <= ((anotherTrapezoid vertices at: 3) x)
            ifTrue: [
                anotherSmall := (anotherTrapezoid vertices at: 2) x.
                anotherLarge := (anotherTrapezoid vertices at: 3) x.
            ] ifFalse: [
                anotherSmall := (anotherTrapezoid vertices at: 3) x.
                anotherLarge := (anotherTrapezoid vertices at: 2) x.
            ].
        anotherHeight := (anotherTrapezoid vertices at: 3) y.

        ^(selfSmall = anotherSmall and: [selfLarge = anotherLarge and: [selfHeight = anotherHeight]]).
    ]

    RightTrapezoid >> + figure [
        | areaSum |
        areaSum := self area + figure area.
        areaSum := areaSum rounded.
        ^(Square new) initialize: areaSum sqrt.
    ]
]

"TESTS"
square1 := Square new initialize: 4.
Transcript show: 'Square area: ', square1 area printString; cr.

square2 := Square new initialize: 6.
Transcript show: 'Square area: ', square2 area printString; cr.

resultSquare := square1 + square2.

Transcript show: 'Combined square area: ', (resultSquare area printString); cr.

"Adding areas for trapezoids"
trapezoid1 := RightTrapezoid new initialize: 8 base1: 15 height: 8.
Transcript show: 'Trapezoid area: ', (trapezoid1 area printString); cr.

trapezoid2 := RightTrapezoid new initialize: 10 base1: 15 height: 8.
Transcript show: 'Trapezoid area: ', (trapezoid2 area printString); cr.

resultTrapezoid := trapezoid1 + trapezoid2.
Transcript show: 'Combined trapezoid area: ', (resultTrapezoid area printString); cr.

trapezoid1 print.
trapezoid2 print.

square1 print.
square2 print.
square1 print.

"Scaling - square"
square1 := square1 scaleBy: 1.5.
square1 print.

trapezoid2 print.
"Scaling - trapezoid"
trapezoid2 := trapezoid2 scaleBy: 3.

trapezoid2 print.
trapezoid2 print.

trapezoid3 := RightTrapezoid new initialize: 10 base1: 15 height: 8.
trapezoid4 := RightTrapezoid new initialize: 15 base1: 10 height: 8.

Transcript show: (trapezoid3 = trapezoid4) printString; cr.

square3 := Square new initialize: 4.
square4 := Square new initialize: 4.

Transcript show: (square3 = square4) printString; cr.
