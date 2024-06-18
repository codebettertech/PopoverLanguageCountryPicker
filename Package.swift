//
//  Package.swift
//  LanguagePopoverMenuPicker
//
//  Created by christian on 17/06/24.
//

// swift-tools-version:5.8
import PackageDescription

let package = Package(
  name: "LanguagePopoverMenuPicker",
  platforms: [
    .macOS(.v10_13),
    .macOS(.v14),
    .iOS(.v14),
    .visionOS(.v1),
    .tvOS(.v13),
  ],
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(
      name: "LanguagePopoverMenuPicker",
      targets: ["LanguagePopoverMenuPicker"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/siteline/swiftui-introspect", from: "1.0.0")
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "LanguagePopoverMenuPicker",
      dependencies: [
        .product(name: "SwiftUIIntrospect", package: "swiftui-introspect")
    ),
    .testTarget(
      name: "LanguagePopoverMenuPickerTests",
      dependencies: ["LanguagePopoverMenuPicker"]
    ),
    .uiTestTarget(
      name: "LanguagePopoverMenuPickerUITests",
      dependencies: ["LanguagePopoverMenuPicker"]
    )
  ]
)
