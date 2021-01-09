//
//  ContentView.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 26.12.2020.
//

import SwiftUI

private enum MemorizeViewConstants {
    static let cornerRadius: CGFloat = 10
    static let strokeLineWidth: CGFloat = 3
    static let fontScaleFactor: CGFloat = 0.75
}

struct MemorizeView: View {
    
    @ObservedObject public var viewModel: MemorizeViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Text(viewModel.themeName)
                    .foregroundColor(viewModel.cardForegroundColor)
                Spacer()
                Text("Score: \(viewModel.score)")
                    .foregroundColor(viewModel.cardForegroundColor)
            }
            .padding()
            Grid(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture(perform: { viewModel.choose(card: card) })
                    .padding()
            }
            .padding()
            .foregroundColor(viewModel.cardForegroundColor)
            Button("Start new game", action: viewModel.newGame)
                .foregroundColor(viewModel.cardForegroundColor)
                .padding()
        }
    }
}

struct CardView: View {
    var card: MemorizeModel<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: MemorizeViewConstants.cornerRadius)
                        .fill(Color.white)
                    RoundedRectangle(cornerRadius: MemorizeViewConstants.cornerRadius)
                        .stroke(lineWidth: MemorizeViewConstants.strokeLineWidth)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: MemorizeViewConstants.cornerRadius)
                            .fill()
                    }
                }
            }
            .font(Font.system(size: min(geometry.size.width,
                                        geometry.size.height) * MemorizeViewConstants.fontScaleFactor))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeView(viewModel: MemorizeViewModel())
    }
}
