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
    @State 
    private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.075526, longitude: 3.780589),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )

    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Contactgegevens")
                    .font(.title)

                Text("Vision Oogcentrum")
                    .font(.headline)

                Text("Antwerpsesteenweg 1022")
                Text("9040 Gent")

                Text("ozlemkose@hotmail.com")
                    .foregroundColor(.primary)
                    .underline()

                Text("+32 470 12 34 56")
                
                //Map with a zoom of 0.1
                Map {
                       Marker("Praktijk", systemImage: "ev.plug.dc.nacs", coordinate: praktijkLocatie)
                   }
                    .frame(height: 200)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    

                .frame(height: 200)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))

                Text("Voor dringende gevallen")
                    .font(.headline)

                Text("Contacteer Sint Lucas Ziekenhuis:")

                Text("www.azstlucas.be")
                    .foregroundColor(.primary)
                    .underline()

                Text("+32 478 90 12 34")
            }
            .padding(20)
        }
        .navigationTitle("Contact")
    }
}

#Preview {
    ContactView()
}
