/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing featured landmarks above a list of all of the landmarks.
*/

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .info

    enum Tab {
        case info
        case list
        case map
        case stadistics
        case camera
    }

    var body: some View {
        
        
        TabView(selection: $selection) {
            
            CategoryHome()
                .tabItem {
                    Label("Información", systemImage: "info.circle")
                }
                .tag(Tab.info)
            
            MapDemo()
                .tabItem {
                    Label("Mapa", systemImage: "globe")
                }
                .tag(Tab.map)
            
            CameraView()
                .tabItem {
                    Label("Reportar", systemImage: "camera")
                }
                .tag(Tab.camera)

            LandmarkList()
                .tabItem {
                    Label("Historial", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
            BarChart()
                .tabItem {
                    Label("Estadisticas", systemImage: "chart.bar")
                }
                .tag(Tab.stadistics)
        }
        .accentColor(Color(red: 0.5, green: 0.8, blue: 0.7))
        //.accentColor(Color(red: 0.2, green: 0.5, blue: 0.8))
        //.accentColor(.green)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
