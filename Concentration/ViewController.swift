//
//  ViewController.swift
//  Concentration
//
//  Created by MB on 3/25/19.
//  Copyright © 2019 MB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Model are generally public but here its private as it is dependent on numberOfPairsOfCards which has cardButtons aint public and is done in Interface Builder
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards : Int {
        return (cardButtons.count+1)/2
    }
    
    // as we dont want anyone to set flipcount but surely can see what its value is
    private(set) var flipCount : Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    //IBOutlets and IBActions are generally private as they are internal implementations of UI thats what viewcontoller does
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
    
    // will be private as its logic on how to udate view
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
    // making private and theen thinking what should be private or not for future implemenation
    // all emoji stuffs are private but we can have emoji public API to have control on what to display
    private var emojiChoices = ["👻","🎃","😈","🍭","😱","🙀","🍎","🦇"]
    
    private var emoji = [Int:String]()
    
    private func emoji(for card : Card)-> String{

        if emoji[card.identifier] == nil, emojiChoices.count>0{

                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))

                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }

        return emoji[card.identifier] ?? "?"
    }
    
}

