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
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    
    //init tends to have same external and internal names
    init(identifier : Int){
        self.identifier = identifier
    }
}
