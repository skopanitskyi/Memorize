//
//  MemorizeViewModel.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 27.12.2020.
//

import Foundation
import SwiftUI

class MemorizeViewModel: ObservableObject {
    
   @Published private var memorizeModel = MemorizeViewModel.createMemorizeModel()
    
    private var openCardsIndex: [Int] = []
    
    public var cards: [MemorizeModel<String>.Card] {
        return memorizeModel.cards
    }
    
    private static var numberOfPairsOfCards: Int {
        return Int.random(in: 2...5)
    }
    
    public func choose(card: MemorizeModel<String>.Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return }
        
        if !cards[index].isMatched, !cards[index].isFaceUp {
            flipAndUpdateCard(with: index)
        }
    }
    
    private func flipAndUpdateCard(with index: Int) {
        memorizeModel.cards[index].isFaceUp = true
        openCardsIndex.append(index)
        
        if openCardsIndex.count == 2 {
            if cards[openCardsIndex[0]].content == cards[openCardsIndex[1]].content {
                openCardsIndex.forEach { memorizeModel.cards[$0].isMatched = true }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.openCardsIndex.forEach { self.memorizeModel.cards[$0].isFaceUp = false }
                self.openCardsIndex.removeAll()
            }
        }
    }
    
    private static func createMemorizeModel() -> MemorizeModel<String> {
        var emojis = [Int](0x1F601...0x1F64F).compactMap { UnicodeScalar($0) }.map { String($0) }
        var cards: [MemorizeModel<String>.Card] = []
        for _ in 0...numberOfPairsOfCards {
            let index = Int.random(in: 0..<emojis.count)
            let emoji = emojis.remove(at: index)
            cards.insert(MemorizeModel<String>.Card(content: emoji), at: randomIndex(for: cards))
            cards.insert(MemorizeModel<String>.Card(content: emoji), at: randomIndex(for: cards))
        }
        return MemorizeModel<String>(cards: cards)
    }
    
    private static func randomIndex(for cards: [MemorizeModel<String>.Card]) -> Int {
        return cards.isEmpty ? 0 : Int.random(in: 0..<cards.count)
    }
}
