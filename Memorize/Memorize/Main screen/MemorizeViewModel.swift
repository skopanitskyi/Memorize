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
    
    public var cards: [MemorizeModel<String>.Card] {
        return memorizeModel.cards
    }
    
    private static func createMemorizeModel() -> MemorizeModel<String> {
        let emojis = [Int](0x1F601...0x1F64F).compactMap { UnicodeScalar($0) }.map { String($0) }
        let numberOfPairsOfCards = Int.random(in: 2...5)
        return MemorizeModel<String>(numberOfPairsOfCards: numberOfPairsOfCards) {
            let index = Int.random(in: 0..<emojis.count)
            return emojis[index]
        }
    }
    
    public func choose(card: MemorizeModel<String>.Card) {
        memorizeModel.choose(card: card)
    }
}
