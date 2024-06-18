//
//  Language.swift
//  LanguagePopoverMenu
//
//  Created by christian on 09/06/24.
//

import Foundation
import SwiftUI

class Country: CountryProtocol {
  public required init?(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
    return nil
  }

  public required init?(coder: NSCoder) {
    return nil
  }

  var nibName: NSNib.Name?

  var nibBundle: Bundle?

  var code: String?
  var flag: String?
  var name: String?

  public static func == (lhs: Country, rhs: Country) -> Bool {
    return true
  }

  static func locale(for regionCode: String) -> String? {
    let languageCode = Locale(identifier: regionCode).language.languageCode?.identifier ?? "en"
    return Locale(identifier: languageCode + "_" + regionCode)
      .localizedString(forRegionCode: regionCode)
  }
}

extension Array where Element: Comparable {
  @available(
    *, deprecated, renamed: "Locale.isoRegionCodes",
    message: "try to bypass the problem with `Locale.Region.isoRegions`"
  )
  public var countriesNames: [Element] {
    let isoCodes: [Element] = [].countriesISOCodes
    var countrieNames: [Element] = []
    for isoCode in isoCodes {
      countrieNames.append(Country.locale(for: isoCode as! String) as! Element)
    }
    return countrieNames
  }

  @available(
    *, deprecated, renamed: "Locale.isoRegionCodes",
    message: "try to bypass the problem with `Locale.Region.isoRegions`"
  )
  public var countriesFlags: [Element] {
    let flagBase = Unicode.Scalar("🇦").value - Unicode.Scalar("A").value
    var flags: [Element] = []
    let isoCodes = Locale.isoRegionCodes
    for isoCode in isoCodes {
      let flag =
        isoCode
        .uppercased()
        .unicodeScalars
        .compactMap({ Unicode.Scalar(flagBase + $0.value)?.description })
        .joined()
      flags.append(flag as! Element)
    }
    flags.sort()
    return flags.unique
  }

  public func filtered(_ searchText: String) -> [Element] {
    return filter { ($0 as! String).lowercased().contains(searchText.lowercased()) }
  }

  @available(
    *, deprecated, renamed: "Locale.isoRegionCodes",
    message: "try to bypass the problem with `Locale.Region.isoRegions`"
  )
  public var countriesISOCodes: [Element] {
    let isoCodes = Locale.isoRegionCodes.unique
    return (isoCodes as? [Element])!
  }

  public var preferredLanguage: [Element] {
    let preferredLanguage = Locale.preferredLanguages.unique
    print(preferredLanguage)
    return (preferredLanguage as? [Element])!
  }

  public func emoji(_ value: Int) -> String {
    guard let scalar = UnicodeScalar(value) else { return "?" }
    return String(Character(scalar))
  }

  public var unique: [Element] {
    var uniqueValues: [Element] = []
    forEach { item in
      guard !uniqueValues.contains(item) else { return }
      uniqueValues.append(item)
    }
    return uniqueValues
  }
}
