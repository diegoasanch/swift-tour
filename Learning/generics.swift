//
//  generics.swift
//  Learning
//
//  Created by Diego Sánchez on 08/10/2023.
//

import Foundation

func makeArray<Item>(repeating item: Item, numberOfItems: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfItems {
        result.append(item)
    }
    return result
}

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}


func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Element]
where T.Element: Equatable, T.Element == U.Element
{
    var common: [T.Element] = []
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                common.append(rhsItem)
            }
        }
    }
    return common
}

func genericsMain() {
    let x = makeArray(repeating: "knock", numberOfItems: 4)
    print(x)
    
    var possibleInteger: OptionalValue<Int> = .none
    print(possibleInteger)
    possibleInteger = .some(100)
    print(possibleInteger)
    
    print(anyCommonElements([1, 2, 3], [3, 2, 6, 8]))
}
