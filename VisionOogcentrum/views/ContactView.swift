//
//  ContactView.swift
//  VisionOogcentrum
//
//  Created by Henry Vergote on 26/12/2023.
//

import SwiftUI
import MapKit

struct ContactView: View {
    let praktijkLocatie = CLLocationCoordinate2D(latitude: 51.075526, longitude: 3.780589)

    
    var body: some View {
        Map {
            Marker("Praktijk", systemImage: "ev.plug.dc.nacs", coordinate: praktijkLocatie)
        }
        
    }
}

#Preview {
    ContactView()
}
