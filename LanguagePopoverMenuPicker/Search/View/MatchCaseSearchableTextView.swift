//
//  MatchCaseSearchableTextView.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import SwiftUI

struct MatchCaseSearchableTextView: View {
    @State private var searchText: String = String.EMPTY_STRING
    @State private var replaceText: String = String.EMPTY_STRING
    @State private var includesText: String = String.EMPTY_STRING
    @State private var excludesText: String = String.EMPTY_STRING
    @State private var scoped: Bool = false
    @State private var caseSensitive: Bool = false
    @State private var preserveCase: Bool = false
    @State private var scopedToOpenEditors: Bool = false
    @State private var excludeSettings: Bool = true
    @State private var state: [String] = [].countriesNames
    @State private var countriesNames: [String] = [].countriesNames


    var filteredCountriesNames: [String] {
            // If the query is empty, return all posts
        guard !searchText.isEmpty else {
            return state
        }

            // Lowercase the query to make it case-insensitive
            // Return only the posts that match the query by title or author
        return countriesNames.filter { name in
            name.description.contains(searchText)
        }
    }

    var body: some View {
        HStack {
            SearchableTextView(
                "Match Case",
                text: $searchText,
                axis: .vertical,
                leadingAccessories: {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, 8)
                        .font(.title3).fontWeight(.thin)
                        .padding(.top, 8)
                        .foregroundStyle(
                            searchText.isEmpty
                            ? Color(nsColor: .secondaryLabelColor)
                            : Color(nsColor: .controlAccentColor)
                        )
                        .help("Show files with matching name")
                },
                trailingAccessories: {
                    Divider()
                    Toggle(
                        isOn: $caseSensitive,
                        label: {
                            Image(systemName: "textformat")
                                .foregroundStyle(caseSensitive ? Color(.controlAccentColor) : Color(.secondaryLabelColor))
                                .font(.title3)
                                .fontWeight(.thin)
                                .padding(.top, 8)
                                .padding(.horizontal, 8)
                        }
                    )
                    .help("Match Case")
                    .onChange(of: caseSensitive) { c, d in
                            //state.caseSensitive = newValue
                        print(c)
                        print(d)
                    }
                },
                clearable: true,
                onClear: {
                        //state.clearResults()
                },
                hasValue: caseSensitive
            )
            .frame(height: 36, alignment: .center)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 4)
            .overlay(alignment: .top) {
                Divider()
                    .opacity(0)
            }
            .onSubmit {
                if !searchText.isEmpty {
                    Task {
                        countriesNames = countriesNames.filter { countryName in
                                countryName.contains(searchText)
                            }
                        print(countriesNames)

                        return countriesNames
                            //await state.search(searchText)
                    }
                } else {
                        // If a user performs a search with an empty string, the search results will be cleared.
                        // This behavior aligns with Xcode's handling of empty search queries.
                        //state.clearResults()
                }
            }
            .onChange(of: searchText) { newValue, newAction in
                countriesNames = countriesNames.filter { _ in countriesNames.contains(newValue) }
            }
        }
    }
}

#Preview {
    MatchCaseSearchableTextView()
}
