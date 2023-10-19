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
            Text("Vision Oogcentrum")
                .font(.title)
                .foregroundStyle(.white)
                .background(Color("AccentColor"))
            TabView {
                Image("BackgroundImage")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .grayscale(1)
                    .padding(.bottom, 10)
                    .ignoresSafeArea(edges: .top)
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

#Preview {
    ContentView().preferredColorScheme(.dark)
}
