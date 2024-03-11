//
//  PollutionList.swift
//  Landmarks
//
//  Created by Alumno on 10/03/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct PollutionList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Pollution] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationSplitView {
            List {

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            
            .navigationTitle("Historial")
        } detail: {
            Text("Historial de reportes")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
