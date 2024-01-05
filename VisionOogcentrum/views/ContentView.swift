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
            HomeView()
            .foregroundStyle(Color("TextColor"))
            .font(.largeTitle)
            .accentColor(.accentColor)
        }
    }
}

#Preview {
    ContentView()
}
