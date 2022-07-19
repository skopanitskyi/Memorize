//
//  ControlButtons.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 19.07.2022.
//

import SwiftUI

struct ControlButtons: View {
    
    private let themes: [Theme]
    @Binding private var index: Int
    
    init(themes: [Theme], index: Binding<Int>) {
        self.themes = themes
        self._index = index
    }
    
    var body: some View {
        HStack {
            ForEach(themes) { theme in
                Spacer()
                Button {
                    index = themes.firstIndex(where: { $0.id == theme.id }) ?? .zero
                } label: {
                    VStack {
                        if let image = theme.image {
                            Image(uiImage: image)
                                .renderingMode(.template)
                        }
                        Text(theme.title)
                    }
                }
            }
            Spacer()
        }
        .foregroundColor(Color.blue)
    }
}
