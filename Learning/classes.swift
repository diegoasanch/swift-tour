//
//  classes.swift
//  Learning
//
//  Created by Diego Sánchez on 08/10/2023.
//

import Foundation

class Shape {
    var numberOfSides = 0
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}


class Square: Shape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of leght \(sideLength)."
    }
}


class Circle: Shape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return 2 * Double.pi * radius
    }
}


class EquilateralTriangle: Shape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set (val) {
            sideLength = val / 3.0
        }
    }
}


func classesMain() {
    var shape = Shape(name:"idk")
    shape.numberOfSides = 7

    print(shape.simpleDescription())

    let test = Square(sideLength: 5.2, name: "my test square")
    print(test.area())
    print(test.simpleDescription())


    var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
    print(triangle.perimeter)
    triangle.perimeter = 9.9
    print(triangle.sideLength)

}

