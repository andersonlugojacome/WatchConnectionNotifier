//
//  WatchConnectionNotifierApp.swift
//  WatchConnectionNotifier
//
//  Created by Anderson Lugo Jacome on 27/11/24.
//

import SwiftUI
import WatchConnectivity

@main
struct WatchConnectionNotifierApp: App {
    init() {
        if WCSession.isSupported() {
            WCSession.default.delegate = WatchConnectivityManager.shared
            WCSession.default.activate()
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
