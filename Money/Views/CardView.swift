//
//  CardView.swift
//  Money
//
//  Created by Антон Пеньков on 04.06.2023.
//

import SwiftUI

struct CardView: View {
    let category: Categories
    let currency: Currency
    
    var body: some View {
        HStack {
            Text(category.title)
                .font(.system(size: 25, weight: .regular, design: .default))
                .bold()
            Spacer()
            Label("\(category.calculateAmount(category.spendings).formatted())", systemImage: "\(currency.sign)")
                .font(.system(size: 25, weight: .regular, design: .rounded))
                .labelStyle(.trailingIcon)
        }
        .padding(.vertical)
        .foregroundColor(category.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var category = Categories.sampleData[1]
    static var currency = Currency.sampleData
    static var previews: some View {
        CardView(category: category, currency: currency)
            .background(category.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
