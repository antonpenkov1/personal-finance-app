//
//  DetailTitleView.swift
//  Money
//
//  Created by Антон Пеньков on 06.06.2023.
//

import SwiftUI

struct DetailTitleView: View {
    @Binding var category: Categories
    @Binding var currency: Currency
    
    var body: some View {
        Section {
            VStack {
                HStack{
                    Spacer()
                    Text(category.title)
                        .font(.system(size: 50, weight: .bold, design: .default))
                    Spacer()
                }
                HStack {
                    Text("\(category.calculateAmount(category.spendings))")
                    Image(systemName: "\(currency.sign)")
                }
                .font(.system(size: 40, weight: .thin, design: .default))
                Text("in total")
                    .font(.system(size: 30, weight: .thin, design: .default))
                    .padding(.bottom)
            }
        }
        .background(category.theme.mainColor)
        .foregroundColor(category.theme.accentColor)
    }
}

struct DetailTitleView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTitleView(category: .constant(Categories.sampleData[0]), currency: .constant(.euro))
    }
}
