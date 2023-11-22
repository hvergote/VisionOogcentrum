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
            LazyVStack {
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
        VStack(alignment: .leading) {
            Text(oogziekte.titel)
                .font(.headline)
        }
        .padding()
        .background(Color("BackgroundColor"))
        .cornerRadius(8)
        .shadow(radius: 4)
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
