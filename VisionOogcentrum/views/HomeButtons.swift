//
//  HomeButtons.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 19/10/2023.
//

import SwiftUI

struct HomeButtons: View {
    @EnvironmentObject var afspraakViewModel: AfspraakViewModel

    var body: some View {
            ZStack {
                GeometryReader { geometry in
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
                    NavigationLink(destination: AfspraakMakenScherm()) {
                          RoundedRectangle(cornerRadius: 12)
                              .fill(Color("BackgroundColor"))
                              .overlay(
                                  Text("Afspraak maken")
                                      .foregroundStyle(Color("TextColor"))
                                      .padding(10)
                                      .font(.body)
                              )
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
                }.padding()
                }
        }
    }
}
#Preview {
    HomeButtons()
}
