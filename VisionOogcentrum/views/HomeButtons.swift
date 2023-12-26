//
//  HomeButtons.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 19/10/2023.
//

import SwiftUI

struct HomeButtons: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("BackgroundImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .grayscale(1)
                    .frame(maxWidth: geometry.size.width)
                    .clipped()
                LazyVGrid(columns: [
                    GridItem(.fixed(170)),
                    GridItem(.fixed(170))
                ], spacing: 5) {
                    ZStack {
                        let base = RoundedRectangle(cornerRadius: 12)
                        Group {
                            base.fill(Color("BackgroundColor"))
                            Button(action: {}, label: {
                                Text("Afspraak maken")
                                    .foregroundStyle(Color("TextColor"))
                                    .padding(10)
                                    .font(.body)
                            })
                        }
                    }
                    NavigationLink(destination: ContactView().font(.body)) {
                        ZStack {
                            let base = RoundedRectangle(cornerRadius: 12)
                            Group {
                                base.fill(Color("BackgroundColor"))
                                Text("Contact")
                                    .foregroundStyle(Color("TextColor"))
                                    .padding(10)
                                    .font(.body)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    NavigationLink(destination: TeamView()) {
                        ZStack {
                            let base = RoundedRectangle(cornerRadius: 12)
                            Group {
                                base.fill(Color("BackgroundColor"))
                                Text("Team")
                                    .foregroundStyle(Color("TextColor"))
                                    .padding(10)
                                    .font(.body)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    NavigationLink(destination: NieuwsView()) {
                        ZStack {
                            let base = RoundedRectangle(cornerRadius: 12)
                            Group {
                                base.fill(Color("BackgroundColor"))
                                Text("Nieuws")
                                    .foregroundStyle(Color("TextColor"))
                                    .padding(10)
                                    .font(.body)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    NavigationLink(destination: AandoeningenView()
                        .navigationBarTitle("Aandoeningen", displayMode: .inline)) {
                        ZStack {
                            let base = RoundedRectangle(cornerRadius: 12)
                            Group {
                                base.fill(Color("BackgroundColor"))
                                Text("Aandoeningen")
                                    .foregroundStyle(Color("TextColor"))
                                    .padding(10)
                                    .font(.body)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    NavigationLink(destination: FAQView().navigationBarTitle("FAQ", displayMode: .inline)) {
                        ZStack {
                            let base = RoundedRectangle(cornerRadius: 12)
                            Group {
                                base.fill(Color("BackgroundColor"))
                                Text("FAQ")
                                    .foregroundStyle(Color("TextColor"))
                                    .padding(10)
                                    .font(.body)
                            }
                        }
                    }
                }
            }
        }
    }
}
/*
struct HomeButtons: View {
    let buttons = ["Afspraak maken", "Afspraak bekijken", "Team", "Nieuws"]
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
                        Button(action: {}, label: {
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
*/
#Preview {
    HomeButtons()
}
