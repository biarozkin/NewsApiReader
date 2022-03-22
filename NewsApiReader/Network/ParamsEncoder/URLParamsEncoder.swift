//
//  URLParamsEncoder.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/22/22.
//

import Foundation

public class URLParamsEncoder: ParamsEncoder {
    private init() {}
    
    static func encode(baseURLString: String,
                       endpoint: EndPointType,
                       token: String? = nil) -> URLRequest? {
        guard let requestParams = endpoint.params,
              var urlComponents = URLComponents(string: baseURLString + endpoint.path) else {
                return nil
        }
        
        var queryItems = [URLQueryItem]()
        let items = requestParams.map { arg -> URLQueryItem in
            return URLQueryItem(name: arg.key, value: arg.value as? String)
        }
        queryItems.append(contentsOf: items)
        urlComponents.queryItems = queryItems
        urlComponents.percentEncodedQuery = urlComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        guard let requestURL = urlComponents.url else {
            return nil
        }
        
        return makeRequest(url: requestURL,
                           endpoint: endpoint,
                           token: token)
    }
}
