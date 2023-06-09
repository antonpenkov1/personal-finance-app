//
//  MainView.swift
//  Money
//
//  Created by Антон Пеньков on 04.06.2023.
//

import SwiftUI
import CoreData

struct MainView: View {
    @Binding var categories: [Categories]
    @Binding var currency: Currency
    
    @State private var editingCurrency = Currency.sampleData
    @State private var isPresentingCurrencyEditView = false
    @State private var isPresentingNewCategoryView = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                List($categories) { $category in
                    NavigationLink(destination:
                                    DetailView(category: $category, currency: $currency)) {
                        CardView(category: category, currency: currency)
                    }
                    .listRowBackground(category.theme.mainColor)
                }
                .navigationTitle("Categories")
                .toolbar {
                    Button(action: {
                        isPresentingCurrencyEditView = true
                        editingCurrency = currency
                    }) {
                        Image(systemName: "\(currency.sign)")
                    }
                    .accessibilityLabel("Change currency, now \(currency.sign)")
                    Button(action: {
                        isPresentingNewCategoryView = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("New Category")
                }
                .sheet(isPresented: $isPresentingCurrencyEditView) {
                    NavigationStack {
                        CurrencyEditView(currency: $editingCurrency)
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") {
                                        isPresentingCurrencyEditView = false
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Done") {
                                        isPresentingCurrencyEditView = false
                                        currency = editingCurrency
                                    }
                                }
                            }
                    }
                }
                .sheet(isPresented: $isPresentingNewCategoryView) {
                    NewCategoryView(categories: $categories, isPresentingNewCategoryView: $isPresentingNewCategoryView)
                }
            }
            .foregroundColor(.black)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button("Income") {
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.black)
                    .foregroundColor(Color.white.opacity(0.9))
                    .cornerRadius(30)
                }
                .padding(.trailing, 20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(categories: .constant(Categories.sampleData), currency: .constant(.euro))
    }
}
