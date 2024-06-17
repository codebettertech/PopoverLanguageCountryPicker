//
//  Searchable.swift
//  LanguagePopoverMenu
//
//  Created by christian on 09/06/24.
//

import Foundation
import Combine
import SwiftUI

@available(macOS 14.0, *)
protocol Searchable: Observable, Encodable, Hashable {

    var searchTerm: String { get set }

    var searchKeys: [String] { get set }

}
