//
//  CardModel.swift
//  SAK
//
//  Created by Zaire on 9/29/22.
//

import Foundation


struct GameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceCard: Int?
    
    mutating func chooseCard(_ card: Card) {
        
        if let choosenIndex = cards.firstIndex(where: {$0.id == card.id }),
           !cards[choosenIndex].isFaceUp,
            !cards[choosenIndex].isMatched
        {
            if let potenialMatchIndex = indexOfTheOneAndOnlyFaceCard {
                if cards[choosenIndex].content == cards[potenialMatchIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potenialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceCard = nil
                
            }
            else {
                for index in 0..<cards.count {
                    cards[index].isFaceUp = false
                }
                
                indexOfTheOneAndOnlyFaceCard = choosenIndex
            }
            
            cards[choosenIndex].isFaceUp.toggle()
        }
        print("Choosen Card = \(cards)")
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
        var isFaceUp: Bool = false
        
        var isMatched: Bool = false
        
        var content: CardContent
        
        var id: Int
        
    }
}
