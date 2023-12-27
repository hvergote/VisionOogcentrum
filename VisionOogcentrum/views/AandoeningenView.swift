//
//  AandoeningenView.swift
//  VisionOogcentrum
//
//  Created by Arnaud De Weghe on 22/11/2023.
//
import Foundation
import SwiftUI

struct AandoeningenView: View {
    @State private var selectedAandoening: OogZiekte? = nil
    @StateObject private var viewModel = OogZiekteViewModel()
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))]) {
                ForEach(viewModel.oogziektes) { oogziekte in
                    AandoeningView(oogziekte: oogziekte)
                        .onTapGesture {
                            selectedAandoening = oogziekte
                        }
                }
            }
            .padding()
            .sheet(item: $selectedAandoening){ oogziekte in
                AandoeningDetailView(oogziekte: oogziekte)
                    .onTapGesture {
                        selectedAandoening = oogziekte
                    }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchOogziektes()
            }
        }
    }
}

struct AandoeningView: View {
    var oogziekte: OogZiekte
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 8)
            Group {
                base.shadow(radius: 4)
                base.fill(Color("BackgroundColor"))
                Text(oogziekte.titel)
                    .font(.headline)
                    .padding()
}
        }
    }
}

struct AandoeningDetailView: View {
    var oogziekte: OogZiekte
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(oogziekte.titel)
                .font(.title)
            
            Divider()
            
            Text("Beschrijving:")
                .font(.headline)
                .foregroundColor(.accentColor)
            
            Text(oogziekte.beschrijving)
                .font(.body)
            
            Divider()
            
            Text("Behandeling(en):")
                .font(.headline)
                .foregroundColor(.accentColor)
            
            Text(oogziekte.behandeling)
                .font(.body)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AandoeningenView()
}
