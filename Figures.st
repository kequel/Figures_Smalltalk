"Definicja klasy Wielokat"
Object subclass: Wielokat [
    | wierzcholki nazwa |

    Wielokat class >> initialize_list: listaWierzcholkow name: nowaNazwa [
        "Konstruktor obiektu - wielokąta"
        ^self new initialize_list: listaWierzcholkow name: nowaNazwa.
    ]

    Wielokat >> initialize_list: listaWierzcholkow name: nowaNazwa [
        nazwa := nowaNazwa.
        wierzcholki := listaWierzcholkow.
    ]

    Wielokat >> initialize: liczbaWierzcholkow name: nowaNazwa [
        nazwa := nowaNazwa.
        wierzcholki := Array new: liczbaWierzcholkow.
        wierzcholki at: 1 put: 0@0.
    ]

    Wielokat >> nazwa [
        ^nazwa.
    ]

    Wielokat >> nazwa: nowaNazwa [
        nazwa := nowaNazwa.
    ]

    Wielokat >> drukuj [
        Transcript show: 'Nazwa: ', nazwa; cr.
        1 to: wierzcholki size do: [:i |
            Transcript show: 'Wierzcholek ', i printString, ': ', (wierzcholki at: i) printString; cr].
        Transcript show: 'Pole = ', self pole printString; cr; cr.
    ]

    Wielokat >> skaluj: skala [
        | noweWierzcholki |
        Transcript show: 'Skaluje boki figury: ', self nazwa, ' o liczbe ', skala printString; cr.
        noweWierzcholki := Array new: wierzcholki size.
        1 to: wierzcholki size do: [:i |
            noweWierzcholki at: i put: (((wierzcholki at: i) x * skala) @ ((wierzcholki at: i) y * skala))].
        ^(self class new) initialize_list: noweWierzcholki name: self nazwa.
    ]
]

"Definicja klasy Kwadrat"
Wielokat subclass: Kwadrat [
    Kwadrat class >> initialize: bok [
        ^self new initialize: bok.
    ]

    Kwadrat >> initialize: bok [
        super initialize: 4 name: 'Kwadrat'.
        wierzcholki at: 2 put: bok@0.
        wierzcholki at: 3 put: bok@bok.
        wierzcholki at: 4 put: 0@bok.
    ]

    Kwadrat >> pole [
        ^(wierzcholki at: 2) x squared.
    ]

    Kwadrat >> = kwadrat [
        ^(self pole) = (kwadrat pole).
    ]

    Kwadrat >> + figura [
        | p |
        p := self pole + figura pole.
        ^(Kwadrat new) initialize: p sqrt.
    ]
]

"Definicja klasy TrapezProstokatny"
Wielokat subclass: TrapezProstokatny [
    TrapezProstokatny class >> initialize: bok bok1: bok1 wys: wys [
        ^self new initialize: bok bok1: bok1 wys: wys.
    ]

    TrapezProstokatny >> initialize: bok bok1: bok1 wys: wys [
        | lista |
        lista := Array new: 4.
        lista at: 1 put: 0@0.
        lista at: 2 put: bok@0.
        lista at: 3 put: bok1@wys.
        lista at: 4 put: 0@wys.
        
        "Ensure wierzcholki is initialized correctly"
        wierzcholki ifNil: [wierzcholki := lista].
        super initialize_list: lista name: 'TrapezProstokatny'.
    ]
    
    TrapezProstokatny >> wierzcholki[
    ^ wierzcholki
    ]

    TrapezProstokatny >> pole [
        | bok bok1 wys |
        bok := (wierzcholki at: 2) x.
        bok1 := (wierzcholki at: 3) x.
        wys := (wierzcholki at: 3) y.
        ^((bok + bok1) / 2.0) * wys.
    ]

    TrapezProstokatny >> = trapez [
        | selfBase1 selfBase2 selfHeight trapezBase1 trapezBase2 trapezHeight |
        (self class = trapez class) ifFalse: [^false].
        selfBase1 := (self wierzcholki at: 2) x.
        selfBase2 := (self wierzcholki at: 3) x.
        selfHeight := (self wierzcholki at: 3) y.
        trapezBase1 := (trapez wierzcholki at: 2) x.
        trapezBase2 := (trapez wierzcholki at: 3) x.
        trapezHeight := (trapez wierzcholki at: 3) y.
        ^(selfBase1 = trapezBase1 and: [selfBase2 = trapezBase2 and: [selfHeight = trapezHeight]]).
    ]

    TrapezProstokatny >> + figura [
        | p |
        p := self pole + figura pole.
        ^(Kwadrat new) initialize: p sqrt.
    ]
]

"dodawanie pol dla kwadrat"
kwadrat1 := Kwadrat new initialize: 4.
Transcript show: 'Pole kwadratu: ', kwadrat1 pole printString; cr.

kwadrat2 := Kwadrat new initialize: 6.
Transcript show: 'Pole kwadratu: ', kwadrat2 pole printString; cr.

wynikkwadrat := kwadrat1 + kwadrat2.
Transcript show: 'Pole z kwadratow: ', (wynikkwadrat pole printString); cr.

"dodawanie pol dla trapez"
trapez1 := TrapezProstokatny new initialize: 8 bok1: 15 wys: 8.
Transcript show: 'Pole trapezu: ', (trapez1 pole printString); cr.

trapez2 := TrapezProstokatny new initialize: 10 bok1: 15 wys: 8.
Transcript show: 'Pole trapezu: ', (trapez2 pole printString); cr.

wyniktrapez := trapez1 + trapez2.
Transcript show: 'Pole z trapezow: ', (wyniktrapez pole printString); cr.

trapez1 drukuj.  
trapez2 drukuj.  

kwadrat1 drukuj.  
kwadrat2 drukuj.  
kwadrat1 drukuj.

"skalowanie - kwadrat"
kwadrat1 := kwadrat1 skaluj: 1.5.
kwadrat1 drukuj.  

trapez2 drukuj.
"skalowanie - trapez"
trapez2 := trapez2 skaluj: 3.
trapez2 drukuj.  

trapez3 := TrapezProstokatny new initialize: 10 bok1: 15 wys: 8.
trapez4 := TrapezProstokatny new initialize: 10 bok1: 15 wys: 8.

Transcript show: (trapez3 = trapez4) printString; cr. 

kwadrat3 := Kwadrat new initialize: 4.
kwadrat4 := Kwadrat new initialize: 4.

Transcript show: (kwadrat3 = kwadrat4) printString; cr.
