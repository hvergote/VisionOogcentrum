//
//  VisionOogcentrumApp.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 12/10/2023.
//

import SwiftUI

@main
struct VisionOogcentrumApp: App {
    @StateObject var afspraakViewModel = AfspraakViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(afspraakViewModel)
        }
    }
}
