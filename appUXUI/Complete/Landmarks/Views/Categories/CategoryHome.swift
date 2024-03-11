/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing featured landmarks above a list of landmarks grouped by category.
*/

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData


    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                        .listRowInsets(EdgeInsets())
                        //.frame(height: 1000) // Adjust the row height as needed
                }
                .padding(.top, 10)
            }
            .navigationBarTitle(Text("Infórmate"))
            .foregroundColor(Color(red: 0.5, green: 0.8, blue: 0.7))
            
        }
        
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
