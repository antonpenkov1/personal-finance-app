//
//  DetailEditView.swift
//  Money
//
//  Created by Антон Пеньков on 06.06.2023.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var category: Categories
    @State private var newCategoryName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Category info")) {
                TextField("Name your category", text: $category.title)
                ThemePicker(selection: $category.theme)
            }
        }
    }
}

struct DetailViewEdit_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(category: .constant(Categories.sampleData[0]))
    }
}
