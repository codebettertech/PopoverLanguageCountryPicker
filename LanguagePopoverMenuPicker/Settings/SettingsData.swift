//
//  Settings.swift
//  LanguagePopoverMenu
//
//  Created by christian on 09/06/24.
//

import Foundation

struct SettingsData: Codable, Hashable {
    var locale: Locale = .init()
    var countrySettings: SettingsData.CountrySettings = .init()

    var theme: Theme = .dark

    init(locale: Locale) {
        self.locale = locale
    }
        /// Explicit decoder init for setting default values when key is not present in `JSON`
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.countrySettings = try container.decodeIfPresent(
            CountrySettings.self, forKey: .countrySettings
        ) ?? .init()
        self.locale = try container.decodeIfPresent(
            Locale.self, forKey: .locale
        ) ?? .init()
    }
}
