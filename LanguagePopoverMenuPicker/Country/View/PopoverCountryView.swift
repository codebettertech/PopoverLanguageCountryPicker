//
//  PopoverCountryView.swift
//  LanguagePopoverMenu
//
//  Created by christian on 08/06/24.
//

import SwiftUI
import SwiftUIIntrospect

struct PopoverCountryView: View {

  @State private var isShowingPopover = false
  @State private var hovering = false

  @Environment(\.colorScheme) var colorScheme

  @ApplicationSettings(\.countrySettings.countriesFlags)
  var countriesFlags

  @ApplicationSettings(\.countrySettings.countriesISOCodes)
  var countriesISOCodes
    var animals = ["Lion", "Tiger", "Elephant", "Leopard"]
    var plants = ["Rose", "Lily", "Tulip", "Orchid"]

  var body: some View {
    ScrollView {
        VStack(alignment: .center) {
        Button {
          self.isShowingPopover.toggle()
        } label: {
          Image(systemName: "person.circle")
            .aspectRatio(contentMode: .fit)
            .clipShape(.circle)
            .foregroundColor(hovering ? .secondary : .white)
            .font(.system(size: 32))
            .frame(width: 40)
        }
        .buttonStyle(.borderless)
        .focusable(false)
        .popover(
          isPresented: $isShowingPopover,
          content: {
              PopoverCountryItemView()
            .frame(minWidth: 320, maxHeight: 640)
            .padding(.bottom, 8)
          }

        )
        .onHover { hover in
          hovering = hover
        }
      }
        
    }
    .preferredColorScheme(.dark)
    .introspect(.scrollView, on: .macOS(.v10_15, .v13, .v14, .v15)) {
        print(type(of: $0))
    }

  }
}

#Preview {
        PopoverCountryView()

}
