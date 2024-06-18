//
//  Settings.swift
//  LanguagePopoverMenu
//
//  Created by christian on 09/06/24.
//

import Combine
import Foundation
import SwiftUI

final class Settings: ObservableObject {

  static var shared: Settings = .init()

  private var storeTask: AnyCancellable!

  private init() {
    self.preferences = .init(locale: Locale.current)
    self.preferences = loadSettings()

    self.storeTask = self.$preferences.throttle(for: 2, scheduler: RunLoop.main, latest: true).sink
    {
      try? self.savePreferences($0)
    }
  }

  static subscript<T>(_ path: WritableKeyPath<SettingsData, T>, suite: Settings = .shared) -> T {
    get {
      suite.preferences[keyPath: path]
    }
    set {
      suite.preferences[keyPath: path] = newValue
    }
  }

  private func loadCountriesInfo() -> [[String]] {
    return preferences.countrySettings.countriesInfo
  }

  /// Published instance of the ``Settings`` model.
  ///
  /// Changes are saved automatically.
  @Published var preferences: SettingsData

  /// Load and construct ``Settings`` model from
  /// `~/Library/Application Support/LanguagePopoverMenuPicker/settings.json`
  private func loadSettings() -> SettingsData {
    if !filemanager.fileExists(atPath: settingsURL.path) {
      try? filemanager.createDirectory(at: baseURL, withIntermediateDirectories: false)
      return .init(locale: Locale.current)
    }

    guard let json = try? Data(contentsOf: settingsURL),
      let prefs = try? JSONDecoder().decode(SettingsData.self, from: json)
    else {
      return .init(locale: Locale.current)
    }
    return prefs
  }

  /// Save``Settings`` model to
  /// `~/Library/Application Support/LanguagePopoverMenuPicker/settings.json`
  private func savePreferences(_ data: SettingsData) throws {
    let data = try JSONEncoder().encode(data)
    let json = try JSONSerialization.jsonObject(with: data)
    let prettyJSON = try JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
    try prettyJSON.write(to: settingsURL, options: .atomic)
  }

  /// Default instance of the `FileManager`
  private let filemanager = FileManager.default

  /// The base URL of settings.
  ///
  /// Points to `~/Library/Application Support/LanguagePopoverMenuPicker/`
  internal var baseURL: URL {
    filemanager
      .homeDirectoryForCurrentUser
      .appendingPathComponent("Library/Application Support/LanguagePopoverMenuPicker", isDirectory: true)
  }

  /// The URL of the `settings.json` settings file.
  ///
  /// Points to `~/Library/Application Support/LanguagePopoverMenuPicker/settings.json`
  private var settingsURL: URL {
    baseURL
      .appendingPathComponent("settings")
      .appendingPathExtension("json")
  }
}
