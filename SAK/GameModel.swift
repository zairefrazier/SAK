//
//  CardModel.swift
//  SAK
//
//  Created by Zaire on 9/29/22.
//

import Foundation


struct GameModel<CardContent> {
    private(set) var cards: Array<Card>
    
    
    mutating func chooseCard(_ card: Card) {
        
        let choosenIndex = index(of: card)
        cards[choosenIndex].isFaceUp.toggle()
        print("Choosen Card = \(cards)")
        
    }
    
    func index(of card:Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numbersOfPairsOfCards: Int, createCardContent: (Int)-> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numbersOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content:  content, id: pairIndex*2+1))
            
        }
        
    }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        
        var isMatched: Bool = false
        
        var content: CardContent
        
        var id: Int
        
    }
    
    
}
