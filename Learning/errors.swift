//
//  errors.swift
//  Learning
//
//  Created by Diego Sánchez on 08/10/2023.
//

import Foundation

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}


func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    else if printerName == "Fire" {
        throw PrinterError.outOfPaper
    }
    return "Job sent"
}


var fridgeIsOpen = false
let fridgeContent = ["milk","eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}

func errorsMain() {
    do {
        //        let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
        let printerResponse = try send(job: 1040, toPrinter: "Fire")
        print(printerResponse)
    } catch PrinterError.onFire {
        print("I'll just put this over here, with the rest of the fire.")
    } catch let printerError as PrinterError {
            print("Printer error: \(printerError)")
    } catch {
        print(error)
    }
    
    let printerSuccess: String? = try? send(job: 1884, toPrinter: "Test")
    print(printerSuccess)
    
    
    if fridgeContains("banana") {
        print("Found a banana")
    }
    print(fridgeIsOpen)
    
}
