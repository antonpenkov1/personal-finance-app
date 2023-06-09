//
//  ThemeView.swift
//  Money
//
//  Created by Антон Пеньков on 06.06.2023.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding(6)
            .font(.title2)
            .bold()
            .foregroundColor(theme.accentColor)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .poppy)
    }
}
