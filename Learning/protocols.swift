//
//  protocols.swift
//  Learning
//
//  Created by Diego Sánchez on 08/10/2023.
//

import Foundation

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}


class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}


func protocolsMain() {
    let a = SimpleClass()
    a.adjust()
    print(a.simpleDescription)
    
    
    var b = SimpleStructure()
    b.adjust()
    print(b.simpleDescription)
    
    var x = 7
    print(x.simpleDescription)
    x.adjust()
    print(x.simpleDescription)
    
    let protocolValue: any ExampleProtocol = a
    print(protocolValue.simpleDescription)
}
