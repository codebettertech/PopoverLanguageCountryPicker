//
//  OnlyFolderSearchableTextField.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import SwiftUI

struct OnlyFolderSearchableTextField: View {
    @State private var searchText: String = String.EMPTY_STRING
    @State private var replaceText: String = String.EMPTY_STRING
    @State private var includesText: String = String.EMPTY_STRING
    @State private var excludesText: String = String.EMPTY_STRING
    @State private var scoped: Bool = false
    @State private var caseSensitive: Bool = false
    @State private var preserveCase: Bool = false
    @State private var scopedToOpenEditors: Bool = false
    @State private var excludeSettings: Bool = true

    var body: some View {
        HStack(spacing: 0) {
            SearchableTextView(
                "Only in folders",
                text: $includesText,
                axis: .vertical,
                leadingAccessories: {
                    Image(systemName: "folder.badge.plus")
                        .padding(.leading, 8)
                        .foregroundStyle(.tertiary)
                        .font(.title3).fontWeight(.thin)
                        .padding(.top, 8)
                },
                trailingAccessories: {
                    Divider()
                    Toggle(
                        isOn: $scopedToOpenEditors,
                        label: {
                            Image(systemName: "doc.plaintext")
                                .foregroundStyle(
                                    scopedToOpenEditors ? Color(.controlAccentColor) : Color(.secondaryLabelColor)
                                )
                                .font(.title3).fontWeight(.thin)
                                .padding(.top, 8)
                        }
                    )
                    .help("Search only in Open Editors")
                },
                clearable: true,
                hasValue: scopedToOpenEditors
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
    OnlyFolderSearchableTextField()
}
