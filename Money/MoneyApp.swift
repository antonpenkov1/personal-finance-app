//
//  MoneyApp.swift
//  Money
//
//  Created by Антон Пеньков on 04.06.2023.
//

import SwiftUI

@main
struct MoneyApp: App {
    @State private var categories = Categories.sampleData
    @State private var currency = Currency.sampleData
    
    var body: some Scene {
        WindowGroup {
            MainView(categories: $categories, currency: $currency)
        }
    }
}
