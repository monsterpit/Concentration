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
    
    var flipCount : Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    //Outlet Collection
    // array are generic type
    // @IBOutlet var cardButons: Array<UIButton>!
    
    // Cmd + left click to rename vaiables names
    @IBOutlet var cardButtons: [UIButton]!    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojiChoices : Array<String> = ["👻","🎃","👻","🎃"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        
        //Variable 'cardNumber' was never mutated; consider changing to 'let' constant
        //Thread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value
        // if let to safely unwrap an Optional
        if let cardNumber = cardButtons.index(of:sender){
           // print("cardNumber = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        else{
            print("Choose cards was not in the list")
        }
        
        //String interpolation produces a debug description for an optional value; did you mean to make this explicit?
        // optional get value optional(int) if no value tehn nil
      //  print("cardNumber = \(cardNumber)")
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

