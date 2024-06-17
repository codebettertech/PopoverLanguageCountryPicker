//
//  ExtensionView.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import Foundation
import SwiftUI

extension View {
    func theme(_ theme: Theme) -> some View {
        environment(\.theme, theme)
    }
}
