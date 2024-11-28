//
//  WatchConnectionNotifierApp.swift
//  WatchConnectionNotifier
//
//  Created by Anderson Lugo Jacome on 27/11/24.
//

import SwiftUI
import UserNotifications
import WatchConnectivity

@main
struct WatchConnectionNotifierApp: App {
    init() {
        // Solicitar permisos de notificaciones
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Permisos de notificaciones concedidos.")
            } else {
                print("Permisos denegados: \(error?.localizedDescription ?? "No especificado").")
            }
        }
        
        // Activar WatchConnectivity
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
