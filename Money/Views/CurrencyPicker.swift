//
//  CurrencyPicker.swift
//  Money
//
//  Created by Антон Пеньков on 05.06.2023.
//

import SwiftUI

struct CurrencyPicker: View {
    @Binding var selection: Currency
    
    var body: some View {
        Picker("Currency", selection: $selection) {
            ForEach(Currency.allCases) { currency in
                Text(currency.name)
                    .tag(currency)
            }
        }
        .pickerStyle(.wheel)
    }
}

struct CurrencyPicker_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyPicker(selection: .constant(.euro))
    }
}
