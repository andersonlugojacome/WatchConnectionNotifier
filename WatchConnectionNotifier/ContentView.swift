//
//  ContentView.swift
//  WatchConnectionNotifier
//
//  Created by Anderson Lugo Jacome on 27/11/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var connectivityManager = WatchConnectivityManager.shared

    var body: some View {
        VStack {
            Text("Estado de conexión 1")
            Text(connectivityManager.isReachable ? "Conectado" : "Desconectado")
                .foregroundColor(connectivityManager.isReachable ? .green : .red)
                .font(.title)
            Image(systemName: connectivityManager.isReachable ? "wifi" : "wifi.slash")
                            .imageScale(.large)
                            .foregroundStyle(.tint)

            Spacer()
        }
        .padding()
    }
}
