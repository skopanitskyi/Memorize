//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 27.12.2020.
//

import Foundation

struct MemorizeModel<CardContent> {
    public var cards: [Card] = []
    
    init(numberOfPairsOfCards: Int, cardContentFactory: () -> CardContent) {
        for _ in 0..<numberOfPairsOfCards {
            let content = cardContentFactory()
            let firstCard = Card(content: content)
            let secondCard = Card(content: content)
            cards.insert(firstCard, at: getIndexForInsertCard())
            cards.insert(secondCard, at: getIndexForInsertCard())
        }
    }
    
    public mutating func choose(card: Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return }
        cards[index].isFaceUp = !cards[index].isFaceUp
    }
    
    private func getIndexForInsertCard() -> Int {
        return cards.isEmpty ? 0 : Int.random(in: 0..<cards.count)
    }
    
    struct Card: Identifiable {
        public var id: UUID = UUID()
        public var isFaceUp: Bool = true
        public var isMatched: Bool = false
        public var content: CardContent
    }
}
