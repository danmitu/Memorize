 //
 //  EmojiMemoryGame.swift
 //  Memorize
 //
 //  Created by Dan Mitu on 5/20/20.
 //
 
 import SwiftUI
 
 class EmojiMemoryGame: ObservableObject {
    
    init() {
        let randomTheme = Themes.randomElement()!
        self.theme = randomTheme
        self.model = EmojiMemoryGame.createMemoryGame(theme: randomTheme)
    }
    
    @Published private var model: MemoryGame<String>
    
    @Published private var theme: Theme {
        didSet {
            model = EmojiMemoryGame.createMemoryGame(theme: theme)
        }
    }
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfCardPairsToShow,
                           cardContentFactory: { theme.emojis[$0] })
    }
        
    // MARK: - Access to the Model
    
    var cards: [MemoryGame<String>.Card] { model.cards }
    
    var title: String { theme.name }
    
    var mainColor: Color { theme.color }
    
    var score: Int { model.score }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        theme = Themes.randomElement()!
    }
    
 }
