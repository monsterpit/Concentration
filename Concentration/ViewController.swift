//
//  ViewController.swift
//  Concentration
//
//  Created by MB on 3/25/19.
//  Copyright © 2019 MB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Cannot use instance member 'cardButtons' within property initializer; property initializers run before 'self' is available
    // lazy cant have property observers
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    
    var flipCount : Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojiChoices : Array<String> = ["👻","🎃","👻","🎃"]
    
    @IBAction func touchCard(_ sender: UIButton) {
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
    
    
    func updateViewFromModel(){
        //   for button in cardButtons{
        //  for index in 1..<cardButtons.count{
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
        }
    }
    
    func emoji(for card : Card)-> String{
        return "?"
    }
    
}

