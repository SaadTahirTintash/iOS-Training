//
//  Concentration.swift
//  MVC
//
//  Created by Tintash on 17/06/2019.
//  Copyright © 2019 Tintash. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairOfCards: Int) {
        for _ in 1...numberOfPairOfCards{
            let card = Card()
            cards += [card,card]
        }
        shuffleCards()
    }
    
    private func shuffleCards(){
        var tempCards = [Card]()
        for _ in cards.indices{
            let randomCard = Int.random(in: cards.indices)
            tempCards.append(cards.remove(at: randomCard))
        }
        cards = tempCards
    }
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    
}
