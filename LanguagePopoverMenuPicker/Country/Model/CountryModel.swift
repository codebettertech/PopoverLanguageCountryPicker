//
//  CountryModel.swift
//  LanguagePopoverMenu
//
//  Created by christian on 08/06/24.
//

import AppKit
import Foundation
import SwiftUI
import Combine
import SwiftData

@Observable
final class CountryModel: CountryProtocol, Identifiable {

  required init?(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
    return nil
  }

  required init?(coder: NSCoder) {
    return nil
  }

    init?(){}


  var nibName: NSNib.Name?

  var nibBundle: Bundle?

  var code: String?
  var flag: String?
  var name: String?

  init(id: String, code: String? = nil, flag: String, name: String? = nil) {
    self.code = code
    self.flag = flag
    self.name = name
  }

}
