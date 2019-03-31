//
//  Concentration.swift
//  Concentration
//
//  Created by MB on 3/25/19.
//  Copyright © 2019 MB. All rights reserved.
//

import Foundation


class Concentration
{
    // As to be public else contration wont know how to use cards
    // As we only want to get value of cards and flipping cards and all is Concentration responsibility
    private(set) var cards = [Card]()
    
    // private we dont want any1 to know and think what it does
    //Computed Property with get and set
    private var indexOfOneAndOnlyFaceUpCard : Int?{
        get{
            var foundIndex : Int?
            for index in cards.indices{
                //checking  if any cards is faceUp and for 2 or 0 cards face up it returns nil else it returns index
                if cards[index].isFaceUp {
                    if foundIndex == nil{
                        foundIndex = index
                    }
                    else{
                        foundIndex = nil
                    }
                }
            }
            return foundIndex
        }

          set{

            for index in cards.indices{
                cards[index].isFaceUp = (index==newValue)
            }
        }
    }
    
    private func chooseCard(at index : Int){
        //checking if cards aint matched
        if !cards[index].isMatched{
            
            //checking if indexOfOneAndOnlyFaceUpCard have value and if current index is not equals to it
            if let matchIndex = indexOfOneAndOnlyFaceUpCard,matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                // turning second card up irrespective of if itsd matched or not
                cards[index].isFaceUp = true

            }
            else{
                indexOfOneAndOnlyFaceUpCard = index
            }
        }

    }
    
 
    // initializer can also be made private but we need it to creates array of cards to let it be as it is
    init(numberOfPairsOfCards : Int){
        for _ in 1...numberOfPairsOfCards{
            
            let card = Card()
            cards += [card,card]
        }

        for cardIndex in cards.indices{
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            (cards[cardIndex],cards[randomIndex]) = (cards[randomIndex],cards[cardIndex])
        }
        
    }
}
