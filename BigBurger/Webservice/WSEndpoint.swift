//
//  WSEndpoint.swift
//  BigBurger
//
//  Created by Anis on 29/07/2022.
//

import Foundation

enum WSEndpoint {
    case burgerList

    private var baseURL: String { "https://uad.io/bigburger/" }

    var fullPath: String {
        var endpoint:String
        switch self {
            case .burgerList:
                endpoint = baseURL
        }
        return endpoint
    }

    enum HTTPMethod: String {
        case post = "POST"
        case get = "GET"
        case patch = "PATCH"
        case delete = "DELETE"
        case put = "PUT"
    }

    var method: HTTPMethod {
        switch self {
            case .burgerList:
                return .get
        }
    }

    var request: URLRequest {
        let urlComponents = URLComponents(string: fullPath)

        guard let url = urlComponents?.url else {
            preconditionFailure("Error fullPath in \(String(describing: self))")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }
}
