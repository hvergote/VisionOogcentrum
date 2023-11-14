//
//  HomeView.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 19/10/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("BackgroundImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .grayscale(1)
                    .padding(.bottom, 10)
                    .frame(maxWidth: geometry.size.width)
                    .clipped()
                
                VStack {
                    TopBar()
                    HomeButtons()
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
