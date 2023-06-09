//
//  NewSpendingView.swift
//  Money
//
//  Created by Антон Пеньков on 06.06.2023.
//

import SwiftUI

struct NewSpendingView: View {
    @Binding var category: Categories
    @State private var oneNewSpending = ""
    
    var body: some View {
        VStack{
            TextField("Type amount", text: $oneNewSpending)
                .frame(width: 300, height: 50)
                .padding(.top, 10)
                .padding(.bottom, 5)
                .padding(.leading, 20)
                .font(.system(size: 30, weight: .semibold))
                .keyboardType(.decimalPad)
            Divider()
            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        let oneSpending = Categories.Spendings(amount: (Int(oneNewSpending) ?? 0))
                        category.spendings.insert(oneSpending, at: 0)
                        oneNewSpending = ""
                    }
                }) {
                    Label("Add", systemImage: "plus")
                }
                .disabled(oneNewSpending.isEmpty)
                .frame(width: 140, height: 50)
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(10)
                .shadow(color: category.theme.shadowColor, radius: 5)
                Spacer()
                Button(action: {
                    withAnimation {
                        let oneSpending = Categories.Spendings(amount: -(Int(oneNewSpending) ?? 0))
                        category.spendings.insert(oneSpending, at: 0)
                        oneNewSpending = ""
                    }
                }) {
                    Label("Spend", systemImage: "minus")
                }
                .disabled(oneNewSpending.isEmpty)
                .frame(width: 140, height: 50)
                .foregroundColor(Color.white)
                .background(Color.red)
                .cornerRadius(10)
                .shadow(color: category.theme.shadowColor, radius: 5)
                Spacer()
            }
            .padding(.top, 5)
            .padding(.bottom, 15)
        }
        .background(category.theme.mainColor)
    }
}

struct DetailButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        NewSpendingView(category: .constant(Categories.sampleData[2]))
    }
}
