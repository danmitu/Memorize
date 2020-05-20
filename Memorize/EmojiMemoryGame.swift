 //
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Dan Mitu on 5/20/20.
//

import SwiftUI
 
class EmojiMemoryGame {
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃"]
        return MemoryGame<String>(numberOfPairsOfCards: 2) { emojis[$0] }
    }
    
    // MARK: - Access to the Model
    
    var cards: [MemoryGame<String>.Card] { model.cards }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
 }
