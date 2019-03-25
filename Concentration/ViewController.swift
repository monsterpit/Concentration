//
//  ViewController.swift
//  Concentration
//
//  Created by MB on 3/25/19.
//  Copyright © 2019 MB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    
    var flipCount : Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    
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
    
    var emojiChoices = ["👻","🎃","😈","🍭","😱","🙀","🍎","🦇"]
    
    //   var emoji = Dictionary<Int,String>()
    var emoji = [Int:String]()
    
    func emoji(for card : Card)-> String{
//        if emoji[card.identifier] != nil{
//            return emoji[card.identifier]!
//        }
//        else{
//            return "?"
//        }
        
//        if emoji[card.identifier] == nil{
//            if emojiChoices.count>0{
//            // Type conversion UInt32 is also a struct it has init
//            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
//           // emoji[card.identifier] = emojiChoices[randomIndex]
//            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
//        }
//        }
        
        
        // back to back if in same line by ","
        if emoji[card.identifier] == nil, emojiChoices.count>0{
                // Type conversion UInt32 is also a struct it has init
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                // emoji[card.identifier] = emojiChoices[randomIndex]
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        
        
        // nil coalescing
        return emoji[card.identifier] ?? "?"
    }
    
}

