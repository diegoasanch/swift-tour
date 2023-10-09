//
//  tour.swift
//  Learning
//
//  Created by Diego Sánchez on 08/10/2023.
//

import Foundation

func tourMain() {
    var greeting = "Hello, playground"

    print("Hello, world")

    let x = 3

    print("x = \(x)")

    let individualScores = [75, 43, 103, 87, 12]
    var teamScore = 0

    for score in individualScores {
        if score > 50 {
            teamScore += 3
        } else {
            teamScore += 1
        }
    }

    let scoreDecoration = if teamScore > 10 {
        "🎉"
    } else {
        ""
    }

    print("Score:", teamScore, scoreDecoration)

    var optionalName: String? = "John Appleseed"
    //optionalName = nil

    if let optionalName {
        print("Hello, \(optionalName)")
    } else {
        print("No one to greet :(")
    }



    let vegetable = "red pepper"
    switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup.")
    }


    for i in 0..<4 {
        print(i)
    }

    func greet(person: String, day: String) -> String {
         "Hello \(person), today is \(day)"
    }

    print(greet(person: "Bob", day: "Sunday"))

}
