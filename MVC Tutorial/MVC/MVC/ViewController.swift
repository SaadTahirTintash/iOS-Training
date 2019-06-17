//
//  ViewController.swift
//  MVC
//
//  Created by Tintash on 17/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairOfCards: (cardButtons.count + 1) / 2)

    @IBOutlet weak var flipCountLabel: UILabel!
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet var cardButtons: [UIButton]!

    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else{
            print("Chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor(white: 1, alpha: 1) : .red
            }
        }
    }

    var emojiChoices = ["😀","😇","😜","🤓","⌚️","🖥","💾","💽"]
    
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int.random(in: emojiChoices.indices)
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
}

