//
//  ThemedView.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import SwiftUI
import Combine
import Foundation

struct ThemedContentView: View {
    @Environment(\.theme) var theme: Theme

    var body: some View {
        VStack {
            if theme == .light {
                Text("Light Theme")
                    .foregroundColor(.black)
                    .background(Color.white)
            } else {
                Text("Dark Theme")
                    .foregroundColor(.white)
                    .background(.black)
            }
        }
        .padding()
    }
}

struct ThemedView: View {
    @State var theme: Theme = .light

    var body: some View {
        VStack {
            Button("Switch Theme") {
                    // Setting our custom environment value
                switch theme {
                    case .dark:
                        theme = .light
                    case .light:
                        theme = .dark
                }
            }
            ThemedView()
        }
        .theme(theme)
    }
}


#Preview {
    ThemedView()
}
