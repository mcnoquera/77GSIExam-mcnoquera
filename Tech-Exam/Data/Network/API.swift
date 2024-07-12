//
//  APIManager.swift
//  Tech-Exam
//
//  Created by Mark Angelo Noquera on 7/12/24.
//

import Foundation
import Moya

enum API {
    case apod
}

extension API: TargetType {
    
    // This is the base URL we'll be using, typically our server.
        var baseURL: URL {
            guard let url = URL(string: Constants.API.baseUrl) else { fatalError() }
            return url
        }
        
        // This is the path of each operation that will be appended to our base URL.
        var path: String {
            switch self {
            case .apod:
                //For test only, but not secure. -Hope you understand for exam omnly
                let demoKey = "?api_key=KzjVlyewomxQdaGzPOOfHlrZFXrKxjudQAxKJk8R"
                return Constants.API.apod + demoKey
            }
        }
        
        // Here we specify which method our calls should use.
        var method: Moya.Method {
            return .get
        }
        
        // Here we specify body parameters, objects, files etc.
        // or just do a plain request without a body.
        // In this example we will not pass anything in the body of the request.
        var task: Task {
            switch self {
            case .apod:
                return .requestPlain
            }
        }
        
        // These are the headers that our service requires.
        // Usually you would pass auth tokens here.
        var headers: [String: String]? {
            return ["Content-type": "application/json"]
        }
        
        // This is sample return data that you can use to mock and test your services,
        // but we won't be covering this.
        var sampleData: Data {
            return Data()
        }
    
}
