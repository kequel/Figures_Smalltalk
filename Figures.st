<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 8.3 of 28 lipca 2017 on 9 listopada 2024 at 19:54:07</time-stamp>


<component-created>
<name>Package1</name> <type>package</type>
</component-created><!-- Package Package1* -->


<component-created>
<name>Package1</name> <type>package</type>
</component-created>

<class>
<name>Wielokat</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>wierzcholki nazwa </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>Package1</package>
</attributes>
</class>

<class>
<name>Kwadrat</name>
<environment>Smalltalk</environment>
<super>Wielokat</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>Package1</package>
</attributes>
</class>

<class>
<name>TrapezProstokatny</name>
<environment>Smalltalk</environment>
<super>Wielokat</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>Package1</package>
</attributes>
</class>

<methods>
<class-id>Wielokat</class-id> <category>comparing</category>

<body package="Package1" selector="=">= figura    "takie same wierzcholki"1 to: wierzcholki size do: [:i |  (self wierzcholki at: i) = (figura wierzcholki at: i) ifFalse: [^false].].    ^true.</body>
</methods>

<methods>
<class-id>Wielokat</class-id> <category>accessing</category>

<body package="Package1" selector="drukuj">drukuj	"wyświetla na ekranie współrzędne wierzchołków wielokąta"	Transcript show: 'Nazwa: ', nazwa; cr.	1 to: wierzcholki size do: [:i | Transcript show: 'wierzcholek ', i printString, ': ', (wierzcholki at: i) printString; cr].	Transcript show: 'Pole = ', self pole printString; cr; cr.</body>

<body package="Package1" selector="nazwa:">nazwa: nowa_nazwa	"ustawia nowa nazwe wielokata"	nazwa:=nowa_nazwa</body>

<body package="Package1" selector="nazwa">nazwa	"podaje nazwe wielokata"	^nazwa</body>
</methods>

<methods>
<class-id>Wielokat</class-id> <category>arithmetic</category>

<body package="Package1" selector="skaluj:">skaluj: skala	"skaluje wielokat o podana skale"	| noweWierzcholki |	Transcript show: 'Skaluje boki figury: ', self nazwa, ' o liczbe ', skala printString; cr.	noweWierzcholki:=Array new: wierzcholki size.	1 to: wierzcholki size do: [:i | noweWierzcholki at: i put: (((wierzcholki at: i) x * skala) @ ((wierzcholki at: i) y * skala))].	^(self class new) initialize_list: noweWierzcholki name: self nazwa</body>
</methods>

<methods>
<class-id>Wielokat</class-id> <category>initialize-release</category>

<body package="Package1" selector="initialize_list:name:">initialize_list: listaWierzcholkow name: nowaNazwa	"konstruktor obiektu - wielokata"	nazwa:=nowaNazwa.	wierzcholki:=listaWierzcholkow.</body>

<body package="Package1" selector="initialize:name:">initialize: liczbaWierzcholkow name: nowaNazwa	"konstruktor obiektu - wielokata"	| lista |	lista:=Array new: liczbaWierzcholkow.	lista at: 1 put: 0@0.	wierzcholki:=lista.	nazwa:=nowaNazwa.</body>
</methods>


<methods>
<class-id>Kwadrat</class-id> <category>comparing</category>

<body package="Package1" selector="=">= kwadrat    "takie same wierzcholki"1 to: wierzcholki size do: [:i |  (self wierzcholki at: i) = (kwadrat wierzcholki at: i) ifFalse: [^false].].    ^true.</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>arithmetic</category>

<body package="Package1" selector="+">+ figura	"dodaj 2 figury w sensie pola"	| p |	p:=self pole + figura pole.	^(Kwadrat new) initialize: p sqrt</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>actions</category>

<body package="Package1" selector="pole">pole	"licz pole kwadratu"	^(wierzcholki at: 2) x squared</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>initialize-release</category>

<body package="Package1" selector="initialize:">initialize: bok	"tworz kwadrat o podanym boku"	super initialize: 4 name: 'Kwadrat'.	wierzcholki at: 2 put: bok@0.	wierzcholki at: 3 put: bok@bok.	wierzcholki at: 4 put: 0@bok.</body>
</methods>


<methods>
<class-id>TrapezProstokatny</class-id> <category>comparing</category>

<body package="Package1" selector="=">= trapez    "takie same wierzcholki"1 to: wierzcholki size do: [:i |  (self wierzcholki at: i) = (trapez wierzcholki at: i) ifFalse: [^false].].    ^true.</body>
</methods>

<methods>
<class-id>TrapezProstokatny</class-id> <category>arithmetic</category>

<body package="Package1" selector="+">+ figura	"dodaj 2 figury w sensie pola"	| p | "tak samo jak kwadrat - bo przeksztalcam to na kwadrat, nie wazne jaka figura, sumowanie jest w sensie pola"	p:=self pole + figura pole.	^(Kwadrat new) initialize: p sqrt</body>
</methods>

<methods>
<class-id>TrapezProstokatny</class-id> <category>actions</category>

<body package="Package1" selector="pole">pole    "licz pole trapezu"    | bok bok1 wys |    bok := (wierzcholki at: 2) x.    bok1 := (wierzcholki at: 3) x.    wys := (wierzcholki at: 3) y.    ^(bok + bok1) / 2.0 * wys</body>
</methods>

<methods>
<class-id>TrapezProstokatny</class-id> <category>initialize-release</category>

<body package="Package1" selector="initialize:">initialize: bok</body>

<body package="Package1" selector="initialize:bok1:wys:">initialize: bok bok1: bok1 wys: wys    "Inicjalizuje trapez prostokątny z trzema parametrami"    | lista |    lista := Array new: 4.    lista at: 1 put: 0@0.          "Pierwszy wierzchołek (0, 0) - początek podstawy bok"    lista at: 2 put: bok@0.        "Drugi wierzchołek na końcu podstawy bok (bok, 0)"    lista at: 3 put: bok1@wys.     "Trzeci wierzchołek na końcu podstawy bok1 (bok1, wys)"    lista at: 4 put: 0@wys.        "Czwarty wierzchołek w punkcie (0, wys) - lewa strona wys"    super initialize_list: lista name: 'TrapezProstokatny'.</body>
</methods>



</st-source>
