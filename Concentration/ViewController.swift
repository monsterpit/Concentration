//
//  ViewController.swift
//  Concentration
//
//  Created by MB on 3/25/19.
//  Copyright © 2019 MB. All rights reserved.
//
// Swift is Strongly typed And Stongly Inferred Language
//UIKit consist of all UI Elements like UIButton
import UIKit

//IBAction creates a method
//IBOutlet Creates and instance variable
//UIViewController Consist of logic of controlling all UI Elements so when we extend this superclass we dont have to worry about controlling of UI
class ViewController: UIViewController {
    
    // instance variable / property
    var flipCount : Int = 0
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        flipCountLabel.text = "Flips: \(flipCount)"
        flipCard(withEmoji: "👻", on: sender)
    }
    @IBAction func touchSecondCard(_ sender: UIButton) {
        flipCount+=1
        flipCountLabel.text = "Flips: \(flipCount)"
        flipCard(withEmoji: "🎃", on: sender)
    }
    
    func flipCard(withEmoji emoji : String,on button : UIButton){
      //  print("flipCard(withEmoji : \(emoji))")
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

