<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 8.3 of 28 lipca 2017 on 15 listopada 2024 at 19:35:24</time-stamp>


<component-created>
<name>projekt</name> <type>package</type>
</component-created><!-- Package projekt* -->


<component-property>
<name>projekt</name> <type>package</type>
<property>packageName</property> <value>'projekt'</value>
</component-property>

<class>
<name>Wielokat</name>
@@ -24,7 +25,7 @@
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>projekt</package>
</attributes>
</class>

@@ -39,7 +40,7 @@
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>projekt</package>
</attributes>
</class>

@@ -54,90 +55,177 @@
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>projekt</package>
</attributes>
</class>

<methods>
<class-id>Wielokat</class-id> <category>accessing</category>

<body package="projekt" selector="drukuj">drukuj
	"wyświetla na ekranie współrzędne wierzchołków wielokąta"
	Transcript show: 'Nazwa: ', nazwa; cr.
	1 to: wierzcholki size do: [:i | Transcript show: 'wierzcholek ', i printString, ': ', (wierzcholki at: i) printString; cr].
	Transcript show: 'Pole = ', self pole printString; cr; cr.</body>

<body package="projekt" selector="nazwa:">nazwa: nowa_nazwa
	"ustawia nowa nazwe wielokata"

	nazwa:=nowa_nazwa</body>

<body package="projekt" selector="nazwa">nazwa
	"podaje nazwe wielokata"

	^nazwa</body>
</methods>

<methods>
<class-id>Wielokat</class-id> <category>arithmetic</category>

<body package="projekt" selector="skaluj:">skaluj: skala
	"skaluje wielokat o podana skale"
	| noweWierzcholki |
	Transcript show: 'Skaluje boki figury: ', self nazwa, ' o liczbe ', skala printString; cr.
	noweWierzcholki:=Array new: wierzcholki size.
	1 to: wierzcholki size do: [:i | noweWierzcholki at: i put: (((wierzcholki at: i) x * skala) @ ((wierzcholki at: i) y * skala))].
	^(self class new) initialize_list: noweWierzcholki name: self nazwa</body>
</methods>

<methods>
<class-id>Wielokat</class-id> <category>initialize-release</category>

<body package="projekt" selector="initialize_list:name:">initialize_list: listaWierzcholkow name: nowaNazwa
	"konstruktor obiektu - wielokata"
	nazwa:=nowaNazwa.
	wierzcholki:=listaWierzcholkow.</body>
<body package="projekt" selector="initialize:name:">initialize: liczbaWierzcholkow name: nowaNazwa
	"konstruktor obiektu - wielokata"
	nazwa:=nowaNazwa.
	wierzcholki:=Array new: liczbaWierzcholkow.
	wierzcholki at: 1 put: 0@0.</body>
</methods>
<methods>
<class-id>Kwadrat class</class-id> <category>actions</category>
<body package="projekt" selector="pole">pole
	"licz pole kwadratu"

	^(wierzcholki at: 2) x squared</body>
</methods>


<methods>
<class-id>Kwadrat</class-id> <category>comparing</category>

<body package="projekt" selector="=">= kwadrat
	"dodaj 2 figury w sensie pola"
	^( self pole)=(kwadrat pole).</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>arithmetic</category>

<body package="projekt" selector="+">+ figura
	"dodaj 2 figury w sensie pola"
	| p |
	p:=self pole + figura pole.
	^(Kwadrat new) initialize: p sqrt</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>actions</category>

<body package="projekt" selector="pole">pole
	"licz pole kwadratu"
	^(wierzcholki at: 2) x squared</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>initialize-release</category>

<body package="projekt" selector="initialize:">initialize: bok
	"tworz kwadrat o podanym boku"
	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok.</body>
</methods>


<methods>
<class-id>TrapezProstokatny</class-id> <category>comparing</category>

<body package="projekt" selector="=">= trapez
    "Sprawdza, czy dwa trapezy prostokątne są przystające"
    | selfBase1 selfBase2 selfHeight trapezBase1 trapezBase2 trapezHeight |
    "Sprawdź, czy oba obiekty są instancjami tej samej klasy"
    (self class = trapez class) ifFalse: [^ false].
    "Pobierz długości podstaw i wysokości dla self"
    selfBase1 := (self wierzcholki at: 2) x.
    selfBase2 := (self wierzcholki at: 3) x.
    selfHeight := (self wierzcholki at: 3) y.
    "Pobierz długości podstaw i wysokości dla trapez"
    trapezBase1 := (trapez wierzcholki at: 2) x.
    trapezBase2 := (trapez wierzcholki at: 3) x.
    trapezHeight := (trapez wierzcholki at: 3) y.
    "Sprawdź, czy obie podstawy i wysokość są równe"
    ^ (selfBase1 = trapezBase1 and: [selfBase2 = trapezBase2 and: [selfHeight = trapezHeight]]).</body>
</methods>

<methods>
<class-id>TrapezProstokatny</class-id> <category>arithmetic</category>

<body package="projekt" selector="+">+ figura
	"dodaj 2 figury w sensie pola"
	| p |
 "tak samo jak kwadrat - bo przeksztalcam to na kwadrat, nie wazne jaka figura, sumowanie jest w sensie pola"
	p:=self pole + figura pole.
	^(Kwadrat new) initialize: p sqrt</body>
</methods>

<methods>
<class-id>TrapezProstokatny</class-id> <category>actions</category>

<body package="projekt" selector="pole">pole
    "licz pole trapezu"
    | bok bok1 wys |
    bok := (wierzcholki at: 2) x.
    bok1 := (wierzcholki at: 3) x.
    wys := (wierzcholki at: 3) y.
    ^(bok + bok1) / 2.0 * wys</body>
</methods>

<methods>
<class-id>TrapezProstokatny</class-id> <category>initialize-release</category>

<body package="projekt" selector="initialize:">initialize: bok</body>
<body package="projekt" selector="initialize:bok1:wys:">initialize: bok bok1: bok1 wys: wys
    "Inicjalizuje trapez prostokątny z trzema parametrami"
    | lista |
    lista := Array new: 4.
    lista at: 1 put: 0@0.          "Pierwszy wierzchołek (0, 0) - początek podstawy bok"
    lista at: 2 put: bok@0.        "Drugi wierzchołek na końcu podstawy bok (bok, 0)"
    lista at: 3 put: bok1@wys.     "Trzeci wierzchołek na końcu podstawy bok1 (bok1, wys)"
    lista at: 4 put: 0@wys.        "Czwarty wierzchołek w punkcie (0, wys) - lewa strona wys"

    super initialize_list: lista name: 'TrapezProstokatny'.</body>
</methods>
