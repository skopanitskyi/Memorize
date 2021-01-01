//
//  Grid.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 31.12.2020.
//

import Foundation
import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    public var items: [Item]
    public var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    private func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            if let index = items.firstIndex(where: { $0.id == item.id }) {
                viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index))
            }
        }
    }
}
