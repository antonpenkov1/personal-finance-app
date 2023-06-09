//
//  CurrencyEditView.swift
//  Money
//
//  Created by Антон Пеньков on 08.06.2023.
//

import SwiftUI

struct CurrencyEditView: View {
    @Binding var currency: Currency
    
    var body: some View {
        Form {
            Section(header: Text("Choose currency")) {
                CurrencyPicker(selection: $currency)
            }
        }
    }
}

struct CurrencyEditView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyEditView(currency: .constant(.euro))
    }
}
