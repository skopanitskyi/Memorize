//
//  Test.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 09.01.2021.
//

import SwiftUI

class Test {
    
    public static let shared = Test()
    
    private(set) var themeName: String
    
    private(set) var cards: [MemorizeModel<String>.Card] = []
    
    private(set) var drawColor: Color
    
    private var theme = MemorizeTheme.getRandomTheme()
    
    private init() {
        themeName = theme.themeName
        drawColor = theme.drawColor
        cards = createMemorizeModel()
    }
    
    public func test() {
        theme = MemorizeTheme.getRandomTheme()
        themeName = theme.themeName
        drawColor = theme.drawColor
        cards = createMemorizeModel()
    }
    
    private func createMemorizeModel() -> [MemorizeModel<String>.Card] {
        var cards: [MemorizeModel<String>.Card] = []
        var emoji = theme.emoji
        for _ in 0..<theme.numberOfCards() {
            let index = Int.random(in: 0..<emoji.count)
            let emoji = emoji.remove(at: index)
            cards.insert(MemorizeModel<String>.Card(content: emoji), at: randomIndex(for: cards))
            cards.insert(MemorizeModel<String>.Card(content: emoji), at: randomIndex(for: cards))
        }
        return cards
    }
    
    private func randomIndex(for cards: [MemorizeModel<String>.Card]) -> Int {
        return cards.isEmpty ? 0 : Int.random(in: 0..<cards.count)
    }
}
