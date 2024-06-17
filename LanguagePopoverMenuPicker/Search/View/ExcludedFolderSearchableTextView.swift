//
//  ExcludedFolderSearchbleTextView.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import SwiftUI

struct ExcludedFolderSearchableTextView: View {
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
                "Excluding folders",
                text: $excludesText,
                axis: .vertical,
                leadingAccessories: {
                    Image(systemName: "folder.badge.minus")
                        .padding(.leading, 8)
                        .foregroundStyle(
                            searchText.isEmpty
                            ? Color(nsColor: .secondaryLabelColor)
                            : Color(nsColor: .controlAccentColor)
                        )
                        .font(.title3).fontWeight(.thin)
                        .padding(.top, 8)
                },
                trailingAccessories: {
                    Divider()
                    Toggle(
                        isOn: $excludeSettings,
                        label: {
                            Image(systemName: "gearshape")
                                .foregroundStyle(
                                    excludeSettings ? Color(nsColor: .secondaryLabelColor)
                                    : Color(nsColor: .controlAccentColor)
                                )
                                .font(.title3).fontWeight(.thin)
                                .padding(.top, 8)
                        }
                    )
                    .help("Use Exclude Settings and Ignore Files")
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
    ExcludedFolderSearchableTextView()
}
