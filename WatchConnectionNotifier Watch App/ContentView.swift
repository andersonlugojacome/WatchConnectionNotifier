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
            Text("Estado de conexión")
                .font(.headline)
            Text(connectivityManager.isReachable ? "Conectado al iPhone" : "Desconectado del iPhone")
                .foregroundColor(connectivityManager.isReachable ? .green : .red)
                .font(.title)
                .padding()

            Image(systemName: connectivityManager.isReachable ? "wifi" : "wifi.slash")
                .imageScale(.large)
                .foregroundStyle(.tint)

            Spacer()
        }
        .padding()
    }
}
