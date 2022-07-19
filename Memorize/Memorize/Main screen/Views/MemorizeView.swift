//
//  ContentView.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 26.12.2020.
//

import SwiftUI

struct MemorizeView: View {
    
    private let themes: [Theme] = [
        .init(
            title: "Smiles",
            image: UIImage(systemName: "person.fill"),
            emojis: ["😀", "😃", "😄", "😁", "😆", "😅", "☺️", "😊", "😇", "😌", "😉", "😘",
                     "🙂", "🙃", "😜", "🤨", "😎", "🤓", "🧐", "🤩", "🥳", "😏", "😒", "😕"]),
        .init(
            title: "Food",
            image: UIImage(systemName: "fork.knife.circle"),
            emojis: ["🍏", "🍎", "🍐", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭",
                     "🍍", "🥥", "🥝", "🍅", "🍆", "🫒", "🧄", "🧅", "🌽", "🥐", "🍟", "🍔"]),
        .init(
            title: "Sport",
            image: UIImage(systemName: "sportscourt"),
            emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🏓", "🎽",
                     "⛸", "🛼", "🛷", "🛹", "🥊", "🤿", "🥌", "🪂", "🎣", "🏹", "⛳️", "🥅"])
    ]
    
    @State private var emojiCount = 6
    @State private var themeIndex = 0
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(themes[themeIndex].emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                    }
                }
            }
            ControlButtons(themes: themes, index: $themeIndex)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeView()
//            .preferredColorScheme(.dark)
    }
}
