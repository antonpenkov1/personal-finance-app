//
//  Theme.swift
//  Money
//
//  Created by Антон Пеньков on 04.06.2023.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {

    case bubblegum
    case buttercup
    case green
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .green, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    var mainColor: Color {
        Color(rawValue)
    }
    var shadowColor: Color {
        switch self {
        case .bubblegum, .buttercup, .green, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .clear
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}
