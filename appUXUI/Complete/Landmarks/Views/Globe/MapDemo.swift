//
//  MapDemo.swift
//  Landmarks
//
//  Created by Alumno on 09/03/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import MapKit

struct MapDemo: View {
    let ubicacion1 = CLLocationCoordinate2D (
        latitude: 25.690671,
        longitude: -100.301577)

    let ubicacion2 = CLLocationCoordinate2D (
        latitude: 25.629801,
        longitude: -100.282865)

    let ubicacion3 = CLLocationCoordinate2D (
        latitude: 25.568136,
        longitude: -100.240644)

    let ubicacion4 = CLLocationCoordinate2D (
        latitude: 25.662202,
        longitude: -100.408777)

    var body: some View {
        Map() {
        Marker("Primera Ubicacion", systemImage: "applelogo", coordinate: ubicacion1)
        Marker("Segunda Ubicacion", systemImage: "applelogo", coordinate: ubicacion2)
        Marker("Tercer Ubicacion", systemImage: "applelogo", coordinate: ubicacion3)
        Marker("Cuarta Ubicacion", systemImage: "applelogo", coordinate: ubicacion4)
    }
    }
    
}

#Preview {
    MapDemo()
}
