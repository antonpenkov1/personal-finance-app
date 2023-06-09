//
//  FoodDetailView.swift
//  Money
//
//  Created by Антон Пеньков on 09.06.2023.
//

import SwiftUI

struct FoodDetailView: View {
    @Binding var category: Categories
    @Binding var currency: Currency
    
    var amountADayPlan: Int
    var dateIsToday: Bool
    var amountTodayLeft: Int
    
    private var progress: Double {
        guard amountADayPlan > 0 else { return 1 }
        return Double(amountTodayLeft) / Double(amountADayPlan)
    }
    
    var body: some View {
        VStack {
            Text("Left to spend on food today:")
                .multilineTextAlignment(.center)
                .font(.system(size: 40, weight: .thin, design: .default))
            HStack {
                Text("\(amountTodayLeft)")
                    .font(.system(size: 40, weight: .bold, design: .default))
                Image(systemName: "\(currency.sign)")
                    .font(.system(size: 40, weight: .thin, design: .default))
            }
            .padding(.top, -5)
            ProgressView(value: progress)
                .progressViewStyle(.linear)
                .frame(width: 200, height: 50)
                .tint(category.theme.accentColor)
                .padding(.top, -20)
        }
        .frame(width: 350, height: 300)
        .background(category.theme.mainColor)
        .ignoresSafeArea()
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(category: .constant(Categories.sampleData[0]), currency: .constant(.euro), amountADayPlan: 15, dateIsToday: true, amountTodayLeft: 12)
    }
}
