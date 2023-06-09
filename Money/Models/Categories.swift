//
//  Categories.swift
//  Money
//
//  Created by Антон Пеньков on 04.06.2023.
//

import Foundation

struct Categories: Identifiable {
    let id: UUID
    var title: String
    var spendings: [Spendings]
    var amount: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, spendings: [Int], amount: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.spendings = spendings.map { Spendings(amount: $0) }
        self.amount = spendings.reduce(0, +)
        self.theme = theme
    }
    
    func calculateAmount(_ spendings: [Categories.Spendings]) -> Int {
        return spendings.reduce(0) { (current, next) -> Int in
            return (current + next.amount)
        }
    }
    
    func calculateAmountForToday() {
        
    }
    
    
}

extension Categories {
    struct Spendings: Identifiable {
        let id: UUID
        var amount: Int
        var date: Date
        
        init(id: UUID = UUID(), amount: Int, date: Date = Date()) {
            self.id = id
            self.amount = amount
            self.date = date
        }
    }
}

extension Categories {
    static var emptyCategory: Categories {
        Categories(title: "", spendings: [], amount: 0, theme: .bubblegum)
    }
}

extension Categories {
    static var sampleData: [Categories] =
    [
        Categories(title: "Food",
                   spendings: [200, -40, 50, -80, 120], amount: 10,
                   theme: .buttercup),
        Categories(title: "Savings",
                   spendings: [200, -40, 50, -80, 120, 300], amount: 10,
                   theme: .lavender),
        Categories(title: "Health",
                   spendings: [200, -40, 50, -80, 120, -50, -100], amount: 10,
                   theme: .poppy),
        Categories(title: "Banks",
                   spendings: [200, -40, 50, -80, 120, -250, 50], amount: 10,
                   theme: .purple),
        Categories(title: "Subscriptions",
                   spendings: [200, -40, 50, -80, 120, -200, 10, -23], amount: 10,
                   theme: .seafoam),
        Categories(title: "Gifts",
                   spendings: [200, -40, 50, -80, 120, -37, -50, -50], amount: 10,
                   theme: .bubblegum),
        Categories(title: "Travel",
                   spendings: [200, -40, 50, -80, 120, 100, -25, 100, -25], amount: 10,
                   theme: .periwinkle)
    ]
}


