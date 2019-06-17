//
//  Card.swift
//  MVC
//
//  Created by Tintash on 17/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import Foundation

struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        identifier = Card.getUniqueIdentifier()
    }
}
