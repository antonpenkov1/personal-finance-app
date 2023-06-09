//
//  CustomBackButton.swift
//  Money
//
//  Created by Антон Пеньков on 06.06.2023.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    let categories: Categories
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20))
                Text("Categories")
            }
        }
        .foregroundColor(categories.theme.accentColor)
    }
}

struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButton(categories: Categories.sampleData[0])
    }
}
