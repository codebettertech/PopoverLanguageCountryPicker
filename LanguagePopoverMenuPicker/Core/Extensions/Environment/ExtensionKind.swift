//
//  ExtensionKind.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import SwiftUI

public enum ExtensionKind: Equatable, CustomStringConvertible {
    public static func == (lhs: ExtensionKind, rhs: ExtensionKind) -> Bool {
        return true
    }


    case action(actionID: String)
    case theme(themeID: String)
    case settings

    public var description: String {
        switch self {
            case .action(let actionID):
                return "Action with ID \(actionID)"
            case .theme(let themeID):
                return "Theme with ID \(themeID)"
            case .settings:
                return "Settings"
        }
    }
}
