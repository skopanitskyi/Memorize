//
//  MemorizeTheme.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 09.01.2021.
//

import Foundation
import SwiftUI

protocol MemorizeThemeProtocol {
    var themeName: String { get }
    var emoji: [String] { get }
    var drawColor: Color { get }
    func numberOfCards() -> Int
}

extension MemorizeThemeProtocol {
    func numberOfCards() -> Int {
        return Int.random(in: 6...9)
    }
}

struct MemorizeTheme {
    public static func getRandomTheme() -> MemorizeThemeProtocol {
        let themes = MemorizeThemes.allCases
        let index = themes.getRandomIndex
        return themes[index].getMemorizeTheme()
    }
}

enum MemorizeThemes: CaseIterable {
    case halloween
    case sport
    case transport
    case clock
    case flag
    case animal
    
    public func getMemorizeTheme() -> MemorizeThemeProtocol {
        switch self {
        case .halloween:
            return HalloweenTheme()
        case .sport:
            return SportTheme()
        case .transport:
            return TransportTheme()
        case .clock:
            return ClockTheme()
        case .flag:
            return FlagTheme()
        case .animal:
            return AnimalTheme()
        }
    }
}

struct HalloweenTheme: MemorizeThemeProtocol {
    public var themeName = "Halloween"
    public var emoji = ["👻", "💀", "🎃", "👹", "☠️", "🧟", "🧟‍♀️", "🧟‍♂️", "😈"]
    public var drawColor = Color.orange
}

struct SportTheme: MemorizeThemeProtocol {
    public var themeName = "Sports"
    public var emoji = ["⚽️", "🏀", "🏈", "⚾️", "🏉", "🏐", "🎾", "🥎", "🥏", "🎱", "🪀",
                        "🏓", "🥍", "🏑", "🏒", "🏸", "🏏", "🥅", "⛳️", "🪁", "🥊", "🤿",
                        "🎣", "🏹", "🥋", "🎽", "🛹", "🛷", "⛷", "🎿", "🥌", "⛸", "🏂",
                        "🪂", "🏋️‍♀️", "🏋️", "🤸‍♀️", "🤸", "⛹️‍♀️", "🧘‍♂️"]
    public var drawColor = Color.blue
}

struct TransportTheme: MemorizeThemeProtocol {
    public var themeName = "Transports"
    public var emoji = ["🚗", "🚕", "🚙", "🚌", "🚑", "🚓", "🏎", "🚎", "🚒", "🚐", "🚚",
                        "🚛", "🚜", "🦽", "🦼", "🏍", "🛵", "🚲", "🛴", "🛺", "🚔", "🚍",
                        "🚠", "🚡", "🚖", "🚘", "🚟", "🚃", "🚋", "🚅", "✈️", "🛩", "🛰",
                        "🚀", "⛵️", "🚁", "🛸", "🚢", "⛴", "🛳"]
    public var drawColor = Color.purple
}

struct ClockTheme: MemorizeThemeProtocol {
    public var themeName = "Clocks"
    public var emoji = ["🕐", "🕑", "🕒", "🕓", "🕗", "🕖", "🕕", "🕔", "🕘", "🕙", "🕚",
                 "🕛", "🕜", "🕝", "🕞", "🕟", "🕣", "🕢", "🕡", "🕠", "🕤", "🕥",
                 "🕦", "🕧"]
    public var drawColor = Color.yellow
}

struct FlagTheme: MemorizeThemeProtocol {
    public var themeName = "Flags"
    public var emoji = ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🏳️‍🌈", "🇺🇳", "🇦🇺", "🇦🇱", "🇦🇽", "🇦🇿",
                 "🇦🇹", "🇩🇿", "🇦🇸", "🇦🇮", "🇦🇴", "🇦🇷", "🇦🇬", "🇦🇶", "🇦🇩", "🇦🇲", "🇦🇼",
                 "🇦🇫", "🇧🇸", "🇧🇾", "🇧🇭", "🇧🇧", "🇧🇩", "🇧🇿", "🇧🇪", "🇧🇯", "🇧🇲", "🇧🇦",
                 "🇧🇶", "🇧🇴", "🇧🇬", "🇧🇼", "🇧🇷", "🇮🇴", "🇺🇦"]
    public var drawColor = Color.green
}

struct AnimalTheme: MemorizeThemeProtocol {
    public var themeName = "Animals"
    public var emoji = ["🐏", "🐑", "🦙", "🐐", "🦌", "🐕", "🐩", "🐈", "🐓", "🦃", "🦚",
                        "🦜", "🦢", "🦩", "🐇", "🐁", "🦔", "🐿", "🐀", "🐉", "🐶", "🐱",
                        "🐰", "🐯", "🦊", "🦁", "🐷", "🐣", "🐥", "🦆", "🦅", "🐝", "🐞",
                        "🦋", "🐢", "🦖", "🐠", "🐳", "🐬", "🦍"]
    public var drawColor = Color.pink
}
