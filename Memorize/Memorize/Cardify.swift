//
//  Cardify.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 10.01.2021.
//

import SwiftUI

private enum CardifyConstants {
    static let cornerRadius: CGFloat = 10
    static let strokeLineWidth: CGFloat = 3
}



struct Cardify: ViewModifier {
    public let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: CardifyConstants.cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: CardifyConstants.cornerRadius)
                    .stroke(lineWidth: CardifyConstants.strokeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: CardifyConstants.cornerRadius)
                    .fill()
            }
        }
    }
}

extension View {
    public func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
