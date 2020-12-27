//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 27.12.2020.
//

import Foundation

struct MemorizeModel<CardContent> {
    public var cards: [Card] = []
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        for index in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(index)
            let card = Card(content: content)
            cards.append(card)
            cards.append(card)
        }
    }
    
    public func choose(card: Card) {
        print(card)
    }
    
    struct Card: Identifiable {
        public var id: UUID = UUID()
        public var isFaceUp: Bool = true
        public var isMatched: Bool = false
        public var content: CardContent
    }
}
