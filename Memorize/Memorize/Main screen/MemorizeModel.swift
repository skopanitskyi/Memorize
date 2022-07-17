//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 27.12.2020.
//

import Foundation

struct MemorizeModel<CardContent> where CardContent: Comparable {
    public var cards: [Card] = []
    
    struct Card: Identifiable, Equatable {
        public var id: UUID = UUID()
        public var isFaceUp: Bool = false
        public var isMatched: Bool = false
        public var content: CardContent
    }
}
