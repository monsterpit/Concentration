//
//  ViewController.swift
//  Concentration
//
//  Created by MB on 3/25/19.
//  Copyright © 2019 MB. All rights reserved.
//

//UIKit consist of all UI Elements like UIButton
import UIKit

//UIViewController Consist of logic of controlling all UI Elements so when we extend this superclass we dont have to worry about controlling of UI
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func touchCard(_ sender: UIButton) {
        print("agh! ghost!")
    }
    
}

