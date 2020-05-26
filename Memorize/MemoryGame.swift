//
//  MemoryGame.swift
//  Memorize
//
//  Created by Dan Mitu on 5/20/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var score: Int = 0
    
    private(set) var cards: [Card]
    
    private var previouslySeenCardIds = Set<Int>()
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), cards[chosenIndex].canBeChosen {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else if previouslySeenCardIds.contains(cards[chosenIndex].id) {
                    score -= 1
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            previouslySeenCardIds.insert(cards[chosenIndex].id)
        }
    }

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards = cards.shuffled()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        
        var canBeChosen: Bool { !isFaceUp && !isMatched }
    }
}
