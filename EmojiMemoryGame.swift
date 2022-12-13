//
//  EmojiMemoryGame.swift
//  SAK
//
//  Created by Zaire on 9/29/22.
//

import Foundation
import SwiftUI



class EmojiMemeryGame: ObservableObject {
    
    
    static let emojis = ["⌨️", "💻", "📱", "🖥","📷","💾","📀","💡","📡","🖱","📼","⌚️","📺","📠","⏰","☎️","🪫","⌛️","🎙","🔌","🧯","💵","🛸","🛰"]
    
    static func createMemoryGame() -> GameModel<String> {
        GameModel<String>(numbersOfPairsOfCards: 3) { pairIndex in EmojiMemeryGame.emojis[pairIndex]}
    }
    
    
    @Published private var model: GameModel<String> = EmojiMemeryGame.createMemoryGame()
    
    var caard: Array<GameModel<String>.Card> {
        return model.cards
    }
    
    func chooseCard(_ card: GameModel<String>.Card) {
        model.chooseCard(card)
        
    }
    
}
