//
//  TopBar.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 19/10/2023.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        HStack(alignment: .bottom) {
            Spacer()
            Text("Vision Oogcentrum")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding(.bottom)
            Spacer()
        }
        .background(Color("AccentColor"))
    }
}

#Preview {
    TopBar()
}
