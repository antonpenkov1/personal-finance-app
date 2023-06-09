//
//  Currency.swift
//  Money
//
//  Created by Антон Пеньков on 05.06.2023.
//

import Foundation

enum Currency: String, CaseIterable, Identifiable {
    case euro
    case dollar
    case pound
    case yen
    case franc
    case florin
    case turkishlira
    case ruble
    case dong
    case indianrupee
    case tenge
    case peseta
    case peso
    case kip
    case won
    case lira
    case austral
    case hryvnia
    case naira
    case guarani
    case colon
    case cedi
    case cruzeiro
    case tugrik
    case mill
    case shekel
    case manat
    case rupee
    case baht
    case lari
    case brasilianreal
    
    var name: String {
        rawValue.capitalized
    }
    var sign: String {
        switch self {
        case .austral, .baht, .brasilianreal, .cedi, .colon, .cruzeiro, .dollar, .dong, .euro, .florin, .franc, .guarani, .hryvnia, .indianrupee, .kip, .lari, .lira, .manat, .mill, .naira, .peseta, .peso, .pound, .ruble, .rupee, .shekel, .tenge, .tugrik, .turkishlira, .won, .yen:
            return "\(rawValue)sign"
        }
    }
    var id: String {
        name
    }
}

extension Currency {
    static var sampleData: Currency = .euro
}

extension Currency {
    static var emptyCurrency: Currency = .euro
}
