# Figures in Smalltalk
This is a Geometric Shapes Demonstration written in Smalltalk, developed as part of the Programming Languages course in our third semester at Gdańsk University of Technology. 
The simulator demonstrates the creation and manipulation of 2 geometric shapes : squares and right trapezoids.

## Authors
- Martyna Borkowska [GitHub](https://github.com/martynkaqhe)
- Karolina Glaza [GitHub](https://github.com/kequel)

## Files
### Figures_EN_version.st 
english version of the project
### Figures_PL_version.st 
polish version of the project
### Tests.txt
additional tests for polish version

## Description
The program allows users to create and manipulate polygons: squares and right trapezoids in a Smalltalk environment. Using object-oriented principles, it demonstrates inheritance, polymorphism, and encapsulation while providing various functionalities such as scaling, adding areas, and comparing geometric objects.

### Polygon (Base Class)
- Represents a general polygon with vertices, a name, and a scaling factor.
- Includes methods for initialization, printing, scaling, and calculating area.
- Provides a base structure for specific shapes.

### Square (Polygon subclass)
#### Methods:
- Area Calculation: Computes the area of the square.
- Comparison: Allows equality checks with other squares based on their area.
- Addition: Adds the areas of two shapes and creates a new square with an equivalent area.
### RightTrapezoid (Polygon subclass)
#### Methods:
- Area Calculation: Computes the trapezoid's area.
- Comparison: Checks equality with another right trapezoid by comparing bases and height.
- Addition: Adds the areas of two shapes and creates a square with an equivalent area.

## Simple example Input and Output
Input:

`square1 := Square new initialize: 4.`

`Transcript show: 'Square area: ', square1 area printString; cr.`

`square2 := Square new initialize: 6.`

`Transcript show: 'Square area: ', square2 area printString; cr.`

`resultSquare := square1 + square2.`

`Transcript show: 'Combined square area: ', (resultSquare area printString); cr.`

Output:

`Square area: 16`

`Square area: 36`

`Combined square area: 52`

