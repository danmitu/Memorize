//
//  Theme.swift
//  Memorize
//
//  Created by Dan Mitu on 5/26/20.
//  Copyright © 2020 Dan Mitu. All rights reserved.
//

import SwiftUI

struct Theme {
    
    init(name: String, emojis: [String], color: Color, numberOfCardPairsToShow: Int? = nil) {
        guard emojis.count > 1 else { fatalError("An emoji theme must have more than one emoji.") }
        self.name = name
        self.emojis = emojis
        self.color = color
        guard let numberOfCardPairsToShow = numberOfCardPairsToShow, numberOfCardPairsToShow <= emojis.count else {
            self.numberOfCardPairsToShow = (2..<emojis.count).randomElement()!
            return
        }
        self.numberOfCardPairsToShow = numberOfCardPairsToShow
    }
    
    let name: String
    let emojis: [String]
    var numberOfCardPairsToShow: Int
    let color: Color
    
}

let Themes = [
    Theme(name: "Classic",
          emojis: ["😀","😂","😉","😍","😛","☹️","😡","😭","🥴",],
          color: .yellow,
          numberOfCardPairsToShow: 6),
    Theme(name: "Halloween",
          emojis: ["👹", "🤡", "👻", "💀", "👽", "🤖", "🎃"],
          color: .orange),
    Theme(name: "The Zoo",
          emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐵"],
          color: .green),
    Theme(name: "Gadgets",
          emojis: ["📱","⌚️","🖥","⏰","🎙","📺","🎮",],
          color: .blue),
    Theme(name: "Silly",
          emojis: ["💩","🍆","👀","💦","😜","💋","🍑"],
          color: .red,
          numberOfCardPairsToShow: 7),
    Theme(name: "The Beach",
          emojis: ["🏖","🏊‍♀️","🏝","🏐","⛵️","🏄‍♀️","🚣‍♀️","😎","☀️","🧴",],
          color: .pink),
]
