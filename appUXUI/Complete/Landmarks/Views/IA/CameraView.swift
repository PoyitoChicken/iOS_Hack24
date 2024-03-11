//
//  ContentView.swift
//  TestML
//
//  Created by Alumno on 09/03/24.
//

import SwiftUI

struct CameraView: View {
    @State private var capturedImage: UIImage?
    @State private var isShowingImagePicker = false

    var body: some View {
        VStack {
            if let image = capturedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                Button("Take Picture") {
                    self.isShowingImagePicker = true
                }
                .padding()
                .sheet(isPresented: $isShowingImagePicker) {
                    ImagePicker(isPresented: self.$isShowingImagePicker, capturedImage: self.$capturedImage)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
