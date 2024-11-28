//
//  ContentView.swift
//  WatchConnectionNotifier
//
//  Created by Anderson Lugo Jacome on 27/11/24.
//

import Foundation
import WatchConnectivity
import UserNotifications

class WatchConnectivityManager: NSObject, ObservableObject, WCSessionDelegate {
    static let shared = WatchConnectivityManager()
    @Published var isReachable: Bool = WCSession.default.isReachable

    private override init() {
        super.init()
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }

    func sessionReachabilityDidChange(_ session: WCSession) {
        DispatchQueue.main.async {
            self.isReachable = session.isReachable
            if !session.isReachable {
                self.sendDisconnectionNotification()
            }
        }
    }

    private func sendDisconnectionNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Desconexión detectada"
        content.body = "El Apple Watch se ha desconectado del iPhone."
        content.sound = .default

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error al enviar notificación: \(error.localizedDescription)")
            }
        }
    }

    // Métodos requeridos por WCSessionDelegate
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("Error al activar WCSession: \(error.localizedDescription)")
        }
    }

    func sessionDidBecomeInactive(_ session: WCSession) {
        print("La sesión se volvió inactiva.")
    }

    func sessionDidDeactivate(_ session: WCSession) {
        print("La sesión fue desactivada.")
        WCSession.default.activate()
    }
}

