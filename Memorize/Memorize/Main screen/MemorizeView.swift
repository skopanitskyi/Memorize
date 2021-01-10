//
//  ContentView.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 26.12.2020.
//

import SwiftUI

private enum MemorizeViewConstants {
    static let fontScaleFactor: CGFloat = 0.65
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
    public let card: MemorizeModel<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90),
                    endAngle: Angle(degrees: 110-90),
                    clockwise: true)
                    .opacity(0.4)
                    .padding(5)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        return min(size.height, size.width) * MemorizeViewConstants.fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeView(viewModel: MemorizeViewModel())
    }
}
