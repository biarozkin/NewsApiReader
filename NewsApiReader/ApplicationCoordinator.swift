//
//  ApplicationCoordinator.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/20/22.
//

import UIKit

final class ApplicationCoordinator: BaseApplicationCoordinator {
    
    // MARK: - Properties
    private var navigation = UINavigationController()
    
    override func startMainFlow() {
        let router = Router(rootController: navigation)
        let coordinator = MainFlowCoordinator(router: router)
        coordinator.start()
        add(coordinator)
        
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}
