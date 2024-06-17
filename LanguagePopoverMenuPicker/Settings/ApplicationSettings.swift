//
//  ApplicationSettings.swift
//  LanguagePopoverMenu
//
//  Created by christian on 09/06/24.
//

import Foundation
import SwiftUI

@propertyWrapper
struct ApplicationSettings<T>: DynamicProperty where T: Equatable {

    var settings: Environment<T>

    let keyPath: WritableKeyPath<SettingsData, T>

    init(_ keyPath: WritableKeyPath<SettingsData, T>) {
        self.keyPath = keyPath
        let settingsKeyPath = (\EnvironmentValues.settings).appending(path: keyPath)
        self.settings = Environment(settingsKeyPath)
    }

    var wrappedValue: T {
        get {
            Settings.shared.preferences[keyPath: keyPath]
        }
        nonmutating set {
            Settings.shared.preferences[keyPath: keyPath] = newValue
        }
    }

    var projectedValue: Binding<T> {
        Binding {
            Settings.shared.preferences[keyPath: keyPath]
        } set: {
            Settings.shared.preferences[keyPath: keyPath] = $0
        }
    }
}
