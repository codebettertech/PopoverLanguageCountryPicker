//
//  CountryProtocol.swift
//  LanguagePopoverMenu
//
//  Created by christian on 09/06/24.
//

import Foundation
import Combine

@available(macOS 14.0, *)
protocol CountryProtocol: Observable, Identifiable, BaseProtocol {

  var code: String? { get set }
  var flag: String? { get set }
  var name: String? { get set }
}

@available(macOS 14.0, *)
extension CountryProtocol {
  func ID() -> String? { return UUID().uuidString }
}
