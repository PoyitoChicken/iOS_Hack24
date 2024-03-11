/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing a single category item.
*/

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(40)
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                

        }
        .padding(.leading, 15)
        
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
