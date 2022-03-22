//
//  JSONParamsEncoder.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/22/22.
//

import Foundation

final class JSONParamsEncoder: ParamsEncoder {
    private init() {}
    
    static func encode(baseURLString: String,
                       endpoint: EndPointType,
                       token: String? = nil) -> URLRequest? {
        guard let requestURL = URL(string: baseURLString + endpoint.path) else { return nil }

        var request: URLRequest?
        if let requestParams = endpoint.params {
            do {
                let paramsData = try JSONSerialization.data(withJSONObject: requestParams,
                                                            options: .prettyPrinted)
                request = makeRequest(url: requestURL,
                                      endpoint: endpoint,
                                      token: token,
                                      paramsData: paramsData)
            } catch let error {
                print("JSONParamsEncoder error = \(error)")
            }
        } else {
            request = makeRequest(url: requestURL,
                                  endpoint: endpoint,
                                  token: token)
        }
        return request
    }
}

