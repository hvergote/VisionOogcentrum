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
            Text("Welkom")
                .tabItem {
                    Image(systemName: "house")
                }
            Text("Afspraken")
                .tabItem {
                    Image(systemName: "calendar.badge.plus")
                }
            Text("Stel je vragen hier")
                .tabItem {
                    Image (systemName: "text.bubble")
                }
        }
        .foregroundStyle(Colors.text)
        .font(.largeTitle)
        .accentColor(Colors.primary)
    }
}

#Preview {
    ContentView()
}
