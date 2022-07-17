//
//  Array+Extension.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 09.01.2021.
//

import Foundation

extension Array {
    public var getRandomIndex: Int {
        return Int.random(in: 0..<self.count)
    }
}
