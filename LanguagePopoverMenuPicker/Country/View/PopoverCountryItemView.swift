//
//  PopoverCountryItemView.swift
//  LanguagePopoverMenu
//
//  Created by christian on 08/06/24.
//

import AppKit
import SwiftUI

@available(macOS 14.0, *)
struct PopoverCountryItemView: View {

  @State private var hovering = false
  @State private var heartPulse: CGFloat = 1
  @State var countriesFlags: [String] = [].countriesFlags
  @State var countriesNames: [String] = [].countriesNames

  let rows = [
    GridItem(.flexible(minimum: 112, maximum: (156)), spacing: 0),
    GridItem(.flexible(minimum: 112, maximum: (156)), spacing: 0),
    GridItem(.flexible(minimum: 112, maximum: (156)), spacing: 0),
    GridItem(.flexible(minimum: 112, maximum: (156)), spacing: 0),
  ]

  var body: some View {

    let size = countriesFlags.count
    VStack(alignment: .center, spacing: 0) {
      SearchableView()
      Divider()
        .frame(height: 3)
        .backgroundStyle(.white)

      ScrollView {

        LazyVGrid(columns: rows, spacing: 0) {
          ForEach(0..<size - 1, id: (\.self)) { index in
            GridRow(alignment: .center) {
              ZStack {
                Color.clear
                  .overlay(
                    alignment: .center,
                    content: {
                      RoundedRectangle(cornerSize: CGSize(width: 6, height: 6), style: .continuous)
                        .padding(8)
                        .foregroundColor(hovering ? .secondary : .white)
                      Text(countriesFlags[index])
                        .font(.system(size: 128))
                        .onTapGesture {
                        }

                    }
                  )

              }
            }
            .frame(width: 148, height: 148, alignment: .center)
            .padding(.vertical, 8)
            .overlay(
              alignment: .centerLastTextBaseline,
              content: {
                Text(countriesNames[index])
                  .foregroundStyle(.white)
                  .font(.headline)
                  .fontWeight(.thin)
              }
            )

          }
        }
        .padding(.horizontal, 8)

      }
    }
    .zIndex(4)

  }
}

#Preview {
    if #available(macOS 14.0, *) {
        PopoverCountryItemView()
    } else {
            // Fallback on earlier versions
    }
}
