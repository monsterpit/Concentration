//
//  Card.swift
//  Concentration
//
//  Created by MB on 3/25/19.
//  Copyright © 2019 MB. All rights reserved.
//

import Foundation

//struct no inheriance , they are value types (they get copied (copy on write semantics used)(Array,String,Dictionary,Int, almost all are structs so you cant avoid struct in Swift))

//struct also gets a free init but it initializes each and every instance variables

struct Card{
    
    // definitely public as we want to now property or state of card
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    
    // private as identifier is internal implementation
    private static var identifierFactory = 0
    
    //Static Methods are sent to Type
    private static func getUniqueIdentifier() -> Int {
       // dont need to type Card as we are in Type Card
        //Card.identifierFactory+=1
        identifierFactory+=1
        return identifierFactory
    }
    
    
    
    //init tends to have same external and internal names
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
