//
//  ViewController.swift
//  Concentration
//
//  Created by MB on 3/25/19.
//  Copyright © 2019 MB. All rights reserved.
//

import UIKit

// MVC
// Model : what your application is (but not how it is displyed)
// Controller : how your model is presented to the user (UI logic)
// View : Your Controller's minions (very generic like UIButton,UIView,etc.)
// delegate is set via a protocol (i.e. its "blind" to class)
// view do not own the data they display
//controller are almost always that data source (not Model)
//Controller intrepret/format Model information for the view
class ViewController: UIViewController {
    
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

            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        else{
            print("Choose cards was not in the list")
        }

    }

    func flipCard(withEmoji emoji : String,on button : UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        }
        else{
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

