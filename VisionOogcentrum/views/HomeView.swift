//
//  HomeView.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 19/10/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0) {
                    TopBar()
                    NavigationStack{
                        HomeButtons()
                    }
                }
            }
        }

#Preview {
    HomeView()
}
