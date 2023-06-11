//
//  DetailView.swift
//  Money
//
//  Created by Антон Пеньков on 05.06.2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var category: Categories
    @Binding var currency: Currency
    @State private var newSpending = ""
    
    @State private var editingCategory = Categories.emptyCategory
    @State private var isPresentingEditView = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("")
                    .frame(height: 240)
                List {
                    Section(header:
                                Label("History", systemImage: "archivebox")
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    ) {
                        ForEach(category.spendings) { item in
                            HStack {
                                Text(String(item.amount))
                                Label("", systemImage: "\(currency.sign)")
                                    .padding(.leading, -8)
                                Spacer()
                                Text(item.date, style: .date)
                            }
                            .foregroundColor(category.theme.accentColor)
                        }
                        .onDelete { indices in
                            category.spendings.remove(atOffsets: indices)
                            category.spendings = category.spendings
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(
                            Capsule()
                                .fill(category.theme.mainColor.opacity(0.8))
                                .padding(2)
                        )
                    }
                }
                .scrollContentBackground(.hidden)
                .background(
                    Image(category.background)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .blur(radius: 2)
                        .overlay(category.theme.mainColor.opacity(0.2))
                )
                .toolbar {
                    Button("Edit") {
                        isPresentingEditView = true
                        editingCategory = category
                    }
                }
                .foregroundColor(category.theme.accentColor)
                .padding(.top, -8)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton(categories: category))
            .accentColor(category.theme.accentColor)
            .sheet(isPresented: $isPresentingEditView) {
                NavigationStack {
                    DetailEditView(category: $editingCategory)
                        .navigationTitle(category.title)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentingEditView = false
                                    category = editingCategory
                                }
                            }
                        }
                }
            }
            VStack {
                DetailTitleView(category: $category, currency: $currency)
                    .padding(.top, -60)
                NewSpendingView(category: $category)
                    .padding(.top, -8)
                Spacer()
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(category: .constant(Categories.sampleData[0]), currency: .constant(.euro))
    }
}
