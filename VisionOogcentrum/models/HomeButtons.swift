//
//  HomeButtons.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 19/10/2023.
//

import SwiftUI

struct HomeButtons: View {
    let buttons = ["Afspraak maken", "Afspraak bekijken", "Team"]
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.fixed(170)),
            GridItem(.fixed(170))
        ], spacing: 5) {
            ForEach(buttons.indices, id: \.self) { index in
                ZStack {
                    let base = RoundedRectangle(cornerRadius: 12)
                    Group {
                        base.fill(Color("BackgroundColor"))
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text(buttons[index])
                                .foregroundStyle(Color("TextColor"))
                                .padding(10)
                                .font(.body)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    HomeButtons()
}
