//
//  ExtensionInfo.swift
//  LanguagePopoverMenu
//
//  Created by christian on 10/06/24.
//

import AppKit
import Foundation
import SwiftUI
import ExtensionFoundation

public typealias XPCReply = (Data?, (any Error)?) -> Void

@objc public protocol XPCWrappable {

    func getExtensionURL(reply: @escaping XPCReply)

    func getExtensionKinds(reply: @escaping XPCReply)

    func getExtensionProcessIdentifier(reply: @escaping (Int32) -> Void)

    func doAction(with identifier: String, reply: @escaping XPCReply)

    func isDebug(reply: @escaping (Bool) -> Void)
}

public struct ExtensionInfo: Identifiable {

    let endpoint: AppExtensionIdentity

    let availableFeatures: [ExtensionKind]

    let isDebug: Bool

    var bundleURL: URL

    var bundle: Bundle?

    var pid: Int32

    public var id: String {
        endpoint.bundleIdentifier
    }

    var name: String {
        endpoint.localizedName
    }

    var version: String? {
        bundle?.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    func restart() {
        kill(pid, SIGKILL)
    }

    init(endpoint: AppExtensionIdentity) async throws {
        self.endpoint = endpoint

        let process = try await AppExtensionProcess(configuration: .init(appExtensionIdentity: endpoint))

        let connection = try process.makeXPCConnection()
        connection.remoteObjectInterface = .init(with: XPCWrappable.self)
        connection.resume()

        defer {
            connection.invalidate()
        }

        self.pid = try await ExtensionInfo.getProcessID(connection)
        self.isDebug = try await ExtensionInfo.getDebugState(connection)
        self.availableFeatures = try await ExtensionInfo.getAvailableFeatures(connection)
        self.bundleURL = try await ExtensionInfo.getBundleURL(connection)
        self.bundle = Bundle(url: bundleURL)
    }
}

    // Functions to get basic information about extension
extension ExtensionInfo {
     static func getProcessID(_ connection: NSXPCConnection) async throws -> Int32 {
         return Int32(Int(21.5))
    }

    private static func getDebugState(_ connection: NSXPCConnection) async throws -> Bool {
        return true
    }

    private static func getAvailableFeatures(_ connection: NSXPCConnection) async throws -> [ExtensionKind] {
        return []
    }

    private static func getBundleURL(_ connection: NSXPCConnection) async throws -> URL {
        return URL(string: "http://")!
    }
}

extension ExtensionInfo {
        /// Bundle identifier of parent app
    var parentBundleIdentifier: String {
        endpoint.bundleIdentifier.split(separator: ".").dropLast().joined(separator: ".")
    }

    var lastPathOfBundleIdentifier: String {
        String(endpoint.bundleIdentifier.split(separator: ".").last!)
    }

        /// Icon of appex folder
    public var icon: NSImage? {
            // Da Fare: Use icon of extension instead of parent app
            // A way to get the path of an .appex file should be used.
            // Unfortunately, NSWorkspace.shared.urlForApplication only seems to work for .app
        let path = NSWorkspace.shared.urlForApplication(withBundleIdentifier: parentBundleIdentifier)
        guard let path else { return nil }

        return NSWorkspace.shared.icon(forFile: path.path)
    }
}
