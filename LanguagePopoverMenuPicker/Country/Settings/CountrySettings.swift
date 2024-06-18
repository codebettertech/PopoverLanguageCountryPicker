//
//  CountrySettings.swift
//  LanguagePopoverMenu
//
//  Created by christian on 09/06/24.
//

import Foundation

extension SettingsData {

    struct CountrySettings: Codable, Hashable {
        var searchTerm: String = String.EMPTY_STRING
        var searchKeys: [String] {
            [].countriesNames
                .map { NSLocalizedString($0, comment: String.EMPTY_STRING) }
        }

            /// A dictionary that stores a file type and a path to an LSP binary
        var countriesFlags: [String] = [].countriesFlags
        var countriesISOCodes: [String] = [].countriesISOCodes
        var preferredLanguage: [String] = [].preferredLanguage
        var countriesNames: [String] = [].countriesNames
        var countriesInfo: [[String]] = []

        init() {}

            /// Explicit decoder init for setting default values when key is not present in `JSON`
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            self.countriesFlags = try container.decodeIfPresent(
                [String].self,
                forKey: .countriesFlags
            ) ?? []
            self.countriesISOCodes = try container.decodeIfPresent(
                [String].self,
                forKey: .countriesISOCodes
            ) ?? []
            self.preferredLanguage = try container.decodeIfPresent(
                [String].self,
                forKey: .preferredLanguage
            ) ?? []
            self.countriesNames = try container.decodeIfPresent(
                [String].self,
                forKey: .countriesNames
            ) ?? []
        }
    }
}
