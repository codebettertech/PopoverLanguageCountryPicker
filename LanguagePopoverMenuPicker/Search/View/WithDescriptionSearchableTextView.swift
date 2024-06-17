//
//  WithDescriptionSearchableTextView.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import SwiftUI

@available(macOS 14.0, *)
struct WithDescriptionSearchableTextView: View {
    @State private var message: String = ""
    @State private var details: String = ""
    @State private var showDetails: Bool = false
    @State private var isCommiting: Bool = false

    var allFilesStaged: Bool {
        return false
    }

    var anyFilesStaged: Bool {
        return false
    }

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                SearchableTextView(
                    "Commit message (required)",
                    text: $message,
                    axis: .vertical
                )
                .lineLimit(1...3)
                .safeAreaInset(edge: .bottom, spacing: 0) {
                    if showDetails {
                        VStack {
                            TextField(
                                "Detailed description",
                                text: $details,
                                axis: .vertical
                            )
                            .textFieldStyle(.plain)
                            .controlSize(.small)
                            .lineLimit(3...5)

                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3.5)
                        .overlay(alignment: .top) {
                            VStack {
                                Divider()
                            }
                        }
                    }
                }
                VStack(spacing: 0) {
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 4)
                .clipped()
                HStack(spacing: 8) {
                    Button {
                        Task {
                            if allFilesStaged {

                            } else {

                            }
                        }
                    } label: {
                        Text(allFilesStaged ? "Unstage All" : "Stage All")
                            .frame(maxWidth: .infinity)
                    }
                    Menu(isCommiting ? "Committing..." : "Commit") {
                        Button("Commit and Push...") {
                            Task {
                                self.isCommiting = true
                                    self.message = ""
                                    self.details = ""
                            }
                        }
                    } primaryAction: {
                        Task {
                            self.isCommiting = true
                                self.message = ""
                                self.details = ""
                        }
                    }
                    .disabled(
                        message.isEmpty ||
                        isCommiting
                    )
                }
                .padding(.top, 8)
            }
            .transition(.move(edge: .top))
            .onChange(of: message) { _, p in
                withAnimation(.easeInOut(duration: 0.25)) {
                    showDetails = !message.isEmpty
                }
            }
        }
    }
}

#Preview {
    if #available(macOS 14.0, *) {
        WithDescriptionSearchableTextView()
    } else {
    }
}
