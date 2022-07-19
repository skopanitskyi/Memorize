//
//  CardView.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 19.07.2022.
//

import SwiftUI

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
