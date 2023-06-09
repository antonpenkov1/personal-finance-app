//
//  NewCategoryView.swift
//  Money
//
//  Created by Антон Пеньков on 09.06.2023.
//

import SwiftUI

struct NewCategoryView: View {
    @State private var newCategory = Categories.emptyCategory
    @Binding var categories: [Categories]
    @Binding var isPresentingNewCategoryView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(category: $newCategory)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewCategoryView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            categories.append(newCategory)
                            isPresentingNewCategoryView = false
                        }
                    }
                }
        }
    }
}

struct NewCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewCategoryView(categories: .constant(Categories.sampleData), isPresentingNewCategoryView: .constant(true))
    }
}
