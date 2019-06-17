//
//  ViewController.swift
//  MVC
//
//  Created by Tintash on 17/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardButtons: [UIButton]!
    var flipCount = 0 {
        didSet{
            //TODO: Set text label
        }
    }
    
    var emojiChoices = ["😀","😇","😜","🤓"]
    
    func flipCard(withEmoji emoji:String, on button: UIButton){
        
    }


}

