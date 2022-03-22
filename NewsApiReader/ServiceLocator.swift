//
//  ServiceLocator.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import Foundation

final class ServiceLocator {
    
    // MARK: - Public properties
    static let shared = ServiceLocator()
    
    // MARK: - Private proerties
    private lazy var services = [ObjectIdentifier: Any]()

    private init() {}
    
    func register<T>(_ service: T) {
        services[ObjectIdentifier(T.self)] = service
    }
    
    func resolve<T>() -> T {
        guard let service = services[ObjectIdentifier(T.self)] as? T else {
            fatalError("ServiceLocator error: trying to get unregistered service!")
        }
        return service
    }
}
