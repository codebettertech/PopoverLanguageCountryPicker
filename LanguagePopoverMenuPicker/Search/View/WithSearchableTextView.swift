//
//  WithSearchableTextView.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import SwiftUI

@available(macOS 14.0, *)
struct WithSearchableTextView: View {
    @State private var searchText: String = String.EMPTY_STRING
    @State private var replaceText: String = String.EMPTY_STRING
    @State private var includesText: String = String.EMPTY_STRING
    @State private var excludesText: String = String.EMPTY_STRING
    @State private var scoped: Bool = false
    @State private var caseSensitive: Bool = false
    @State private var preserveCase: Bool = false
    @State private var scopedToOpenEditors: Bool = false
    @State private var excludeSettings: Bool = false
    var body: some View {
        HStack(spacing: 0) {
            SearchableTextView(
                "With",
                text: $searchText,
                axis: .vertical,
                leadingAccessories: {
                    Image(systemName: "arrow.2.squarepath")
                        .padding(.leading, 8)
                        .foregroundStyle(
                            $searchText.wrappedValue.isEmpty
                            ? Color(nsColor: .secondaryLabelColor)
                            : Color(nsColor: .controlAccentColor)
                        )
                        .font(.title3).fontWeight(.thin)
                        .padding(.top, 8)
                },
                trailingAccessories: {
                    Divider()
                    Toggle(
                        isOn:  $preserveCase,
                        label: {
                            Text("AB")
                                .font(.system(size: 12, design: .rounded))
                                .foregroundStyle(
                                    searchText.isEmpty
                                    ? Color(nsColor: .secondaryLabelColor)
                                    : Color(nsColor: .controlAccentColor)
                                )
                                .font(.title3).fontWeight(.thin)
                                .padding(.top, 8)
                        }
                    )
                    .help("Preserve Case")
                },
                clearable: true,
                hasValue: excludeSettings
            )
            .frame(height: 36, alignment: .center)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 4)
            .overlay(alignment: .top) {
                Divider()
                    .opacity(0)
            }
        }
    }
}

#Preview {
    if #available(macOS 14.0, *) {
        WithSearchableTextView()
    } else {
            // Fallback on earlier versions
    }
}
