//
//  ContentView.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 12/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                HomeView()
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
            .foregroundStyle(Color("TextColor"))
            .font(.largeTitle)
            .accentColor(.accentColor)
        }
    }
}

#Preview {
    ContentView()
}
