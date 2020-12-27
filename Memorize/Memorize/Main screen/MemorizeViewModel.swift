//
//  MemorizeViewModel.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 27.12.2020.
//

import Foundation

class MemorizeViewModel {
    
    private var memorizeModel = MemorizeViewModel.createMemorizeModel()
    
    public var cards: [MemorizeModel<String>.Card] {
        return memorizeModel.cards
    }
    
    private static func createMemorizeModel() -> MemorizeModel<String> {
        let emojis = ["😸", "🙀"]
        return MemorizeModel<String>(numberOfPairsOfCards: 2) { index in
            return emojis[index]
        }
    }
    
    public func choose(card: MemorizeModel<String>.Card) {
        memorizeModel.choose(card: card)
    }
}
