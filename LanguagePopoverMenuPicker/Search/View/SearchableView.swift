//
//  SearchableView.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import SwiftUI


struct SearchableView: View {
    @State private var text = ""

    var body: some View {
        VStack {
            FilterSearchableTextView()
        }
        .frame(alignment: .center)
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
    }
}



struct SearchedView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchableView()
                .environment(\.colorScheme, .dark)
        }
    }
}

