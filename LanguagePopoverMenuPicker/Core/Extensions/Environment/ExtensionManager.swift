//
//  ExtensionManager.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import Foundation
import SwiftUI
import ExtensionFoundation

class ExtensionManager: ObservableObject {

    static var shared = ExtensionManager()

    @Published var extensions: [ExtensionInfo] = []

    init() {}

}
