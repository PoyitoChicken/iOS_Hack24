//
//  SendRequest.swift
//  TestML
//
//  Created by Alumno on 09/03/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case failedRequest(Error)
    case invalidResponse
}

func postLogs(reportType: String, reportSubtype: String, imageLink: String, locationX: Double, locationY: Double, completion: @escaping (Result<Data, NetworkError>) -> Void) {
    // Construct the request URL
    guard let url = URL(string: "http://localhost:3100/postLog") else {
        completion(.failure(.invalidURL))
        return
    }
    
    // Create the request
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // Create the request body
    let requestBody: [String: Any] = [
        "report_type": reportType,
        "report_subtype": reportSubtype,
        "imageLink": imageLink,
        "location_x": locationX,
        "location_y": locationY
    ]
    
    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
    } catch {
        completion(.failure(.noData))
        return
    }
    
    // Create URLSession task for making the request
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            completion(.failure(.failedRequest(error)))
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            completion(.failure(.invalidResponse))
            return
        }
        
        guard let responseData = data else {
            completion(.failure(.noData))
            return
        }
        
        completion(.success(responseData))
    }
    
    // Start the URLSession task
    task.resume()
}

/* Example usage:
postLogs(reportType: "Suelo", reportSubtype: "Basura", imageLink: "https://example.com/image.jpg", locationX: 123.456, locationY: 789.012) { result in
    switch result {
    case .success(let responseData):
        // Handle successful response data
        print("Response data:", responseData)
    case .failure(let error):
        // Handle error
        print("Error:", error)
    }
}
*/
