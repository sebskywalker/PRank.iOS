//
//  MapView.swift
//  PRank
//
//  Created by seb's on 11/12/24.
//
import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 39.8283, longitude: -98.5795),
        span: MKCoordinateSpan(latitudeDelta: 15.0, longitudeDelta: 25.0) // Aumenta el delta para mostrar más área
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
