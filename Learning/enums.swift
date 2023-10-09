//
//  enums.swift
//  Learning
//
//  Created by Diego Sánchez on 08/10/2023.
//

import Foundation

func enumMain() {
    enum Rank: Int {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
    
        func simpleDescription() -> String {
            switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
            }
        }
    }
    let ace = Rank.ace
    let aceRawValue = ace.rawValue
    
    print(ace)
    print(aceRawValue)
    print(Rank.two)
    print(Rank.two.simpleDescription())
    
    
    enum Suit {
        case spades, hearts, diamonds, clubs
    
        func simpleDescription() -> String {
            switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
            }
        }
    
        func color() -> String {
            switch self {
            case .spades, .clubs:
                return "red"
            case .hearts, .diamonds:
                return "black"
            }
        }
    }
    
    
    let x = Suit.clubs
    print(x.color())
    
    enum ServerResponse {
        case result(sunrise: String, sunset: String)
        case failure(String)
    }
    
    let success = ServerResponse.result(sunrise: "6:00 am", sunset: "8:09 pm")
    let failure = ServerResponse.failure("Out of cheese")
    
    switch success {
    case let .result(sunrise: sunr, sunset: suns):
        print("Sunrise is at \(sunr) and sunset is at \(suns)")
    case let.failure(message):
        print("Failure... \(message)")
    }
    
    
    struct Card {
        var rank: Rank
        var suit: Suit
    
        func simpleDescription() -> String {
            return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
        }
    }
    
    let threeOfSpades = Card(rank: .three, suit: .spades)
    let threeOfSpadesDescription = threeOfSpades.simpleDescription()
    
    print(threeOfSpadesDescription)
}
