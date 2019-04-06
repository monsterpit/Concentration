//
//  ViewController.swift
//  Concentration
//
//  Created by MB on 3/25/19.
//  Copyright © 2019 MB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards : Int {
        return (cardButtons.count+1)/2
    }
    
    private(set) var flipCount : Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
   
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount+=1
        
        if let cardNumber = cardButtons.index(of:sender){
            
            game.chooseCard(at: cardNumber)
            // as view is out of sync with model we update View
            updateViewFromModel()
        }
        else{
            print("Chosen cards was not in the list")
        }
        
    }
    
    private func updateViewFromModel(){
        
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) :  #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
            
            // MARK:- Crash App
//            if index > Int(arc4random_uniform(UInt32(100))){
//                exit(-1)
//            }
        }
    }
    
    private var emojiChoices = ["👻","🎃","😈","🍭","😱","🙀","🍎","🦇"]
    
    //private var emoji = [Int:String]()
    //Type 'Card' does not conform to protocol 'Hashable'
    private var emoji = [Card:String]()
    
    private func emoji(for card : Card)-> String{
        //Making card hashable rather than having to check for card.identifier
  //changing card.identifier to card
//cannot subscript a value of type '[Int : String]' with an index of type 'Card'
        if emoji[card] == nil, emojiChoices.count>0{

                let randomIndex = emojiChoices.count.arc4random

                emoji[card] = emojiChoices.remove(at: randomIndex)
        }

        return emoji[card] ?? "?"
    }
    
}
//MARK:- extension
extension Int{
    var arc4random : Int {
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else{
            return 0
        }
    }
}
