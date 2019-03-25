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
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard : Int?
    
    func chooseCard(at index : Int){
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
                
                //setting indexOfOneAndOnlyFaceUpCard to nil as 2 cards are up now
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else{
                // either no cards or 2 cards are faceup
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                
                // flipping selected card up
                cards[index].isFaceUp = true
                
                // setting indexOfOneAndOnlyFaceUpCard to indexd of card
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    init(numberOfPairsOfCards : Int){
        for _ in 1...numberOfPairsOfCards{
            
            let card = Card()
            cards += [card,card]
        }
        
        //TODO: Shuffle the cards
    }
}
