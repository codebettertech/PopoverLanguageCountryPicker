//
//  EnvironmentValues.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import Foundation
import SwiftUI

struct SettingsDataEnvironmentKey: EnvironmentKey {
    static let defaultValue: SettingsData = .init(locale: Locale.current)
}
struct ThemeEnvironmentKey: EnvironmentKey {
    static let defaultValue: Theme = .light
}
struct CountriesInfoEnvironmentKey: EnvironmentKey {
  public static let defaultValue: [[String]] = [[]]
}
struct CountriesFlagEnvironmentKey: EnvironmentKey {
  public static let defaultValue: [String] = []
}
struct CountriesISOCodeEnvironmentKey: EnvironmentKey {
  public static let defaultValue: [String] = []
}
struct CountriesNamesEnvironmentKey: EnvironmentKey {
  public static let defaultValue: [String] = []
}
struct PreferredLanguageEnvironmentKey: EnvironmentKey {
  public static let defaultValue: [String] = []
}
extension EnvironmentValues {
  var settings: SettingsDataEnvironmentKey.Value {
    get { self[SettingsDataEnvironmentKey.self] }
    set { self[SettingsDataEnvironmentKey.self] = newValue }
  }
    var theme: ThemeEnvironmentKey.Value {
        get { self[ThemeEnvironmentKey.self] }
        set { self[ThemeEnvironmentKey.self] = newValue }
    }
  var countriesInfo: [[String]] {
    get { self[CountriesInfoEnvironmentKey.self] }
    set { self[CountriesInfoEnvironmentKey.self] = newValue }
  }

  var countriesFlags: [String] {
    get { self[CountriesFlagEnvironmentKey.self] }
    set { self[CountriesFlagEnvironmentKey.self] = newValue }
  }

  var countriesISOCodes: [String] {
    get { self[CountriesISOCodeEnvironmentKey.self] }
    set { self[CountriesISOCodeEnvironmentKey.self] = newValue }
  }
  var countriesName: [String] {
    get { self[CountriesNamesEnvironmentKey.self] }
    set { self[CountriesNamesEnvironmentKey.self] = newValue }
  }
  var preferredLanguage: [String] {
    get { self[PreferredLanguageEnvironmentKey.self] }
    set { self[PreferredLanguageEnvironmentKey.self] = newValue }
  }
}
