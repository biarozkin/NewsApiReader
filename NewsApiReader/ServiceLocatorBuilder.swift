//
//  ServiceLocatorBuilder.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import Foundation

// FYI. ServiceLocatorBuilder made to handle shared objects.

final class ServiceLocatorBuilder {
    
    private init() {}
    
    static func build() {
        let locator = ServiceLocator.shared
        
        let network = BaseNetworkService()
        let requestsNetworkService: IRequestsNetworkService = RequestsNetworkService(networkService: network)
        locator.register(requestsNetworkService)
    }
}
