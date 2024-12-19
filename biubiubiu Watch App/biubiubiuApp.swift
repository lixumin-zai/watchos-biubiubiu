//
//  biubiubiuApp.swift
//  biubiubiu Watch App
//
//  Created by lixumin on 2024/12/18.
//

import SwiftUI

@main
struct biubiubiu_Watch_App: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                BiuView().tabItem {
                    Label("视图 1", systemImage: "1.circle")
                }
                FishView().tabItem {
                    Label("视图 1", systemImage: "1.circle")
                }
            }
        }
    }
}
