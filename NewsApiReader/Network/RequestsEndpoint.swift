//
//  RequestsEndpoint.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/22/22.
//

import Foundation

// FYI. RequestsEndpoint was created for a test purposes as a generic endpoint.
//      In real world there should be more than one endpoints for each entity.

enum RequestsEndpoint: EndPointType {
    
    private enum ParamsKeys: String {
        case sources = "sources"
    }
    
    case getAllSources
    case getArticlesBySource(sourceID: String)
    
    var path: String {
        switch self {
        case .getAllSources:
            return "v2/top-headlines/sources"
        case .getArticlesBySource(_):
            return "/v2/everything"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var params: [String: Any]? {
        switch self {
        case .getArticlesBySource(let sourceID):
            return [ParamsKeys.sources.rawValue: sourceID]
        default:
            return nil
        }
    }

    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getAllSources:
            return .json
        case .getArticlesBySource(_):
            return .url
        }
    }
    
    var headers: [String: String]? {
        return baseHeaders
    }
}
