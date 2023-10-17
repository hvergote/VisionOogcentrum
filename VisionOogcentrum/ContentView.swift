//
//  ContentView.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 12/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("welkom")
                .tabItem {
                    Image(systemName: "house")
                }
            Text("afspraken")
                .tabItem {
                    Image(systemName: "calendar")
                }
            Text("stel je vragen hier")
                .tabItem {
                    Image (systemName: "text.bubble")
                }
        }
    }
}

#Preview {
    ContentView()
}
