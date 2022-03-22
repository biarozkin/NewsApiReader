//
//  ParamsEncoder.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/22/22.
//

import Foundation

public enum ParameterEncoding {
    case json
    case url
}

protocol ParamsEncoder {
    static func encode(baseURLString: String,
                       endpoint: EndPointType,
                       token: String?) -> URLRequest?
    static func makeRequest(url: URL,
                            endpoint: EndPointType,
                            token: String?,
                            paramsData: Data?) -> URLRequest?
}

extension ParamsEncoder {
    
    static func makeRequest(url: URL,
                            endpoint: EndPointType,
                            token: String? = nil,
                            paramsData: Data? = nil) -> URLRequest? {
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        if let unwrappedParams = paramsData {
            request.httpBody = unwrappedParams
        }
        
        var headers = endpoint.headers
        headers?[HeaderKeys.token.rawValue] = token
        request.allHTTPHeaderFields = headers
        
        return request
    }
}
