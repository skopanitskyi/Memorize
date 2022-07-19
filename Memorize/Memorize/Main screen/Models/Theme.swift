//
//  Theme.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 19.07.2022.
//

import Foundation
import UIKit

struct Theme: Identifiable {
    public let id = UUID().uuidString
    public let title: String
    public let image: UIImage?
    public let emojis: [String]
}
