//
//  Model.swift
//  TestML
//
//  Created by Alumno on 09/03/24.
//

import Foundation
import CoreML
import Vision
import UIKit

class ImageClassifier{
    //This creates a callable instance
    func jpg2CGimage(imageData : UIImage) -> CGImage {
        /*
         guard let uiImage = UIImage(data: imageData) else {
         fatalError("Failed to create UIimage from JPEG data")
         }
         */
        guard let cgImage = imageData.cgImage else {
            fatalError("Failed to create CGImage from UIImage")
        }
        return cgImage
    }
    func DetectorModel() -> VNCoreMLModel {
        let defaultConfig = MLModelConfiguration()
        //Instance it
        let imageClasifier = try? ML_Functional1(configuration: defaultConfig)
        
        //Guard it
        guard let imageClasifier = imageClasifier else {
            fatalError("App failed to create an image classifier model instance.")
        }
        let imageClassifierModel = imageClasifier.model
        
        guard let imageClassifierModel = try? VNCoreMLModel(for: imageClassifierModel) else {
            fatalError("App failed to create a VNCoreMLModel instance")
        }
        return imageClassifierModel
    }
    
    //Create a caller
    func makeDetectorRequest(used_image: UIImage) -> [String]? {
        let imageClassificationRequest = VNCoreMLRequest(model: DetectorModel())
        imageClassificationRequest.imageCropAndScaleOption = .centerCrop
        let handler = VNImageRequestHandler(cgImage: jpg2CGimage(imageData: used_image))
        do {
            try handler.perform([imageClassificationRequest])
            guard let observations = readResults(result: handler, request: imageClassificationRequest),
                  let firstObservation = observations.first else {
                fatalError("Failed to read results")
            }
            
            // Return the classification label from the first observation.
            return firstObservation.identifier.components(separatedBy: "_")
        } catch {
            fatalError("Failed to perform request")
        }
    }
    
    
    func readResults(result: VNImageRequestHandler, request: VNRequest) -> [VNClassificationObservation]? {
        guard let observations = request.results as? [VNClassificationObservation] else {
            fatalError("VNRequest produced the wrong result \(type(of: request.results)).")
        }
        return observations
    }
    
}

