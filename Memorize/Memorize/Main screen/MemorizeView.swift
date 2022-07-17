//
//  ContentView.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 26.12.2020.
//

import SwiftUI

struct MemorizeView: View {
  
  private let emojis = ["😀", "😃", "😄", "😁", "😆", "😅", "☺️", "😊", "😇", "😌", "😉", "😘", "🙂", "🙃", "😜","🤨","😎","🤓","🧐","🤩","🥳","😏","😒","😕"]
  
  @State private var emojiCount = 6
  
  var body: some View {
    VStack {
      Text("Memorize!")
        .font(.largeTitle)
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
          ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
            CardView(content: emoji)
          }
        }
      }
      ControlButtons {
        if emojiCount > 1 {
          emojiCount -= 1
        }
      } addHandler: {
        if emojis.count > emojiCount {
          emojiCount += 1
        }
      }
    }
    .padding(.horizontal)
  }
}

struct CardView: View {
  
  @State private var isUp = true
  
  private let content: String
  
  init(content: String) {
    self.content = content
  }
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 25)
        .fill()
        .foregroundColor(.white)
      RoundedRectangle(cornerRadius: 25)
        .strokeBorder(lineWidth: 3)
      Text(content)
        .font(.largeTitle)
      RoundedRectangle(cornerRadius: 25)
        .fill(isUp ? .clear : .red)
    }
    .foregroundColor(.red)
    .aspectRatio(2/3, contentMode: .fit)
    .onTapGesture {
      withAnimation {
        isUp.toggle()
      }
    }
  }
}

struct ControlButtons: View {
  
  private let deleteHandler: (() -> Void)?
  private let addHandler: (() -> Void)?
  
  init(deleteHandler: (() -> Void)?, addHandler: (() -> Void)?) {
    self.deleteHandler = deleteHandler
    self.addHandler = addHandler
  }
  
  var body: some View {
    HStack {
      deleteButton
      Spacer()
      addButton
    }
    .font(.largeTitle)
  }
  
  private var deleteButton: some View {
    Button {
      deleteHandler?()
    } label: {
      Image(systemName: "minus.circle")
    }
  }
  
  private var addButton: some View {
    Button {
      addHandler?()
    } label: {
      Image(systemName: "plus.circle")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MemorizeView()
      .preferredColorScheme(.dark)
  }
}
