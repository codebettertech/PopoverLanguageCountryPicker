//
//  FilterSearchableTextView.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import SwiftUI

@available(macOS 14.0, *)
struct FilterSearchableTextView: View {
    @State private var text = String.EMPTY_STRING
    @State private var stashChangesIsPresented = false
    @State private var noChangesToStashIsPresented = false
    @State private var noDiscardChangesIsPresented = false

    var body: some View {
        HStack(spacing: 0) {
            //sourceControlMenu
            SearchableTextView(
                "Filter",
                text: $text,
                leadingAccessories: {
                    Image(
                        systemName: text.isEmpty
                        ? "line.3.horizontal.decrease.circle"
                        : "line.3.horizontal.decrease.circle.fill"
                    )
                    .font(.title3).fontWeight(.thin)
                    .padding(.top, 8)
                    .padding(.leading, 4)
                    .foregroundStyle(
                        text.isEmpty
                        ? Color(nsColor: .secondaryLabelColor)
                        : Color(nsColor: .controlAccentColor)
                    )
                    .padding(.leading, 4)
                    .help("Filter Changes Navigator")
                },
                clearable: true,
                hasValue: true
            )
        }
        .frame(height: 36, alignment: .center)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 8)
        .overlay(alignment: .top) {
            Divider()
                .opacity(0)
        }
    }

    private var sourceControlMenu: some View {
        Menu {
            Button("Discard All Changes...") {
                if discardChangesDialog() {
                }
            }
            Button("Stash Changes...") {
            }
        } label: {}
            .background {
                Image(systemName: "ellipsis.circle")
            }
            .menuStyle(.borderlessButton)
            .menuIndicator(.hidden)
            .frame(maxWidth: 18, alignment: .center)
            .sheet(isPresented: $stashChangesIsPresented) {
            }
            .alert("Cannot Stash Changes", isPresented: $noChangesToStashIsPresented) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("There are no uncommitted changes in the local repository for this project.")
            }
            .alert("Cannot Discard Changes", isPresented: $noDiscardChangesIsPresented) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("There are no uncommitted changes in the local repository for this project.")
            }
    }

        /// Renders a Discard Changes Dialog
    func discardChangesDialog() -> Bool {
        let alert = NSAlert()

        alert.messageText = "Do you want to discard all uncommitted, local changes?"
        alert.informativeText = "This operation cannot be undone."
        alert.alertStyle = .warning
        alert.addButton(withTitle: "Discard")
        alert.addButton(withTitle: "Cancel")

        return alert.runModal() == .alertFirstButtonReturn
    }
}


#Preview {
    if #available(macOS 14.0, *) {
        FilterSearchableTextView()
    } else {
            // Fallback on earlier versions
    }
}
