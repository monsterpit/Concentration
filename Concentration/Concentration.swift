//
//  Concentration.swift
//  Concentration
//
//  Created by MB on 3/25/19.
//  Copyright © 2019 MB. All rights reserved.
//

import Foundation

// Model name always on whats the program is about
// Always think about public API
//API(Application Programming interface its just a list of all the methods and instance variables in that class)
//Public API all the list of methods and instance variables that you will allow other classes to call
// class inheritance , they are refrence type
// classes get a free init unless all the instance variables are intialized
class Concentration
{
    var cards = [Card]()
    
    func chooseCard(at index : Int){
        
    }
    
    // we are having init has we want to create game based on number of cards 
    init(numberOfPairsOfCards : Int){
        // default init in struct
        //  let card = Card(isFaceUp: false, isMatched: false, identifier: identifier)
        
        //array,string,countable range are examples of sequence
        for identifier in 1...numberOfPairsOfCards{
            let card = Card(identifier : identifier)
            
            //let matchingCard = Card(identifier : identifier)
            // as struct copies
            //        let matchingCard = card
            //        cards.append(card)
            //        cards.append(matchingCard)
            
            // because putting things in array also makes a copy
//            cards.append(card)
//            cards.append(card)
            
          cards += [card,card]
        }
    }
}
