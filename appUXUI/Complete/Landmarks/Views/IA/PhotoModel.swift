//
//  ContentView.swift
//  TestML
//
//  Created by Alumno on 09/03/24.
//

import SwiftUI

// UIViewControllerRepresentable wrapper for UIImagePickerController
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var capturedImage: UIImage?

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No update needed
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
             let ML = ImageClassifier()
            if let image = info[.originalImage] as? UIImage {
                parent.capturedImage = image

                let result = ML.makeDetectorRequest(used_image: image)
                postLogs(reportType: result?[0] ?? "100",
                         reportSubtype: result?[1] ?? "100",
                         imageLink: "xdxdxd",
                         locationX: 123.3212,
                         locationY: -123.3212) { result in
                    switch result {
                    case .success(let data):
                        // Handle success, e.g., process the response data
                        print("Network request succeeded. Received data: \(data)")
                    case .failure(let error):
                        // Handle failure, e.g., display error message
                        print("Network request failed with error: \(error)")
                    }
                }
            }
            parent.isPresented = false
        }
    }
}

