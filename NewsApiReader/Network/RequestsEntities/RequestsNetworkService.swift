//
//  RequestsNetworkService.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import Foundation

// FYI. RequestsNetworkService is general object made for test purposes.
//      In production there should be more of them acccording to each entity.

protocol IRequestsNetworkService {
    func getSources(completion: @escaping ([NewsSource]) -> Void)
    func getNewsBySource(_ sourceID: String, completion: @escaping ([Article]) -> Void)
}

final class RequestsNetworkService {
    
    private let networkService: BaseNetworkService
    
    init(networkService: BaseNetworkService) {
        self.networkService = networkService
    }
}

// MARK: - IRequestsNetworkService
extension RequestsNetworkService: IRequestsNetworkService {
    
    func getSources(completion: @escaping ([NewsSource]) -> Void) {
        let endPoint = RequestsEndpoint.getAllSources
        networkService.sendRequest(endPoint: endPoint) { result in
            switch result {
            case .value(let data, _):
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                      let sources = json["sources"],
                      let sourcesData = try? JSONSerialization.data(withJSONObject: sources, options: .prettyPrinted),
                      let objects = try? JSONDecoder().decode([NewsSource].self, from: sourcesData) else {
                    return completion([])
                }
    
                return completion(objects)
            case .failure(let error):
                // FIXME: - Add error handling.
                print(error)
            }
        }
    }
    
    func getNewsBySource(_ sourceID: String, completion: @escaping ([Article]) -> Void) {
        let endPoint = RequestsEndpoint.getArticlesBySource(sourceID: sourceID)
        networkService.sendRequest(endPoint: endPoint) { result in
            switch result {
            case .value(let data, _):
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                      let sources = json["articles"],
                      let sourcesData = try? JSONSerialization.data(withJSONObject: sources, options: .prettyPrinted),
                      let objects = try? JSONDecoder().decode([Article].self, from: sourcesData) else {
                    return completion([])
                }
                
                return completion(objects)
            case .failure(let error):
                // FIXME: - Add error handling.
                print(error)
            }
        }
    }
}

