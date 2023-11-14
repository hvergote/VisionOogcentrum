//
//  ContentView.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 12/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
<<<<<<< Updated upstream:VisionOogcentrum/views/ContentView.swift
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
=======
        TabView {
            HomeView()
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
>>>>>>> Stashed changes:VisionOogcentrum/ContentView.swift
        }
    }
}

#Preview {
    ContentView()
    
}

