//
//  RequestConstants.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/20/22.
//

import Foundation

enum HeaderKeys: String {
    case contentType = "Content-Type"
    case token = "Authorization"
}

enum NetworkCodes: Int {
    case success = 200
    // TODO: - Describe other situations.
}

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}

protocol EndPointType: BaseEndPointType {
    var params: [String: Any]? { get }
    var parameterEncoding: ParameterEncoding { get }
}

protocol BaseEndPointType {
    var baseHeaders: [String: String] { get }
    
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
}

extension BaseEndPointType {
    var baseHeaders: [String: String] {
        return [HeaderKeys.contentType.rawValue: "application/json"]
    }
}
