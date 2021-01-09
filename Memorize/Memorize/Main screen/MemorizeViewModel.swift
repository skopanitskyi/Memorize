//
//  MemorizeViewModel.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 27.12.2020.
//

import Foundation
import SwiftUI

class MemorizeViewModel: ObservableObject {
    
    
    @Published private var memorizeModel = MemorizeModel<String>(cards: Test.shared.cards)
    
    @Published private(set) var score = 0
    
    private var openCardsIndex: [Int] = []
    
    private var flipedCards: [MemorizeModel<String>.Card] = []
    
    public var cards: [MemorizeModel<String>.Card] {
        return memorizeModel.cards
    }
    
    public var cardForegroundColor: Color {
        return Test.shared.drawColor
    }
    
    public var themeName: String {
        return Test.shared.themeName
    }
    
    public func choose(card: MemorizeModel<String>.Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return }
        
        if !cards[index].isMatched, !cards[index].isFaceUp {
            flipAndUpdateCard(with: index)
        }
    }
    
    public func newGame() {
        Test.shared.test()
        score = 0
        memorizeModel = MemorizeModel<String>(cards: Test.shared.cards)
    }
    
    private func flipAndUpdateCard(with index: Int) {
        memorizeModel.cards[index].isFaceUp = true
        openCardsIndex.append(index)
        
        
        if openCardsIndex.count == 2 {
            if cards[openCardsIndex[0]].content == cards[openCardsIndex[1]].content {
                openCardsIndex.forEach { memorizeModel.cards[$0].isMatched = true }
                score += 2
            } else {
                openCardsIndex.forEach { index in
                    if flipedCards.contains(cards[index]) {
                        score -= 1
                    }
                }
                openCardsIndex.filter { !flipedCards.contains(cards[$0]) }.forEach { flipedCards.append(cards[$0])}
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.openCardsIndex.forEach { self.memorizeModel.cards[$0].isFaceUp = false }
                self.openCardsIndex.removeAll()
            }
        }
    }
}
