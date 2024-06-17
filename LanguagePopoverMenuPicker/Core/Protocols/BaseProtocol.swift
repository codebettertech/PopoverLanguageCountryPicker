//
//  BaseProtocol.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import Foundation
import AppKit


protocol BaseProtocol {
     init?(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?)

     init?(coder: NSCoder)

     var nibName: NSNib.Name? { get }

     var nibBundle: Bundle? { get }
}
