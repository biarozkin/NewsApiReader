//
//  BaseApplicationCoordinator.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/20/22.
//

import UIKit

class BaseApplicationCoordinator: BaseCoordinator {
    
    // MARK: - Properties
    let window: UIWindow
    
    // MARK: - Initialization
    required init(window: UIWindow) {
        self.window = window
        
        super.init()
    }
    
    // MARK: - Coordinatable
    override func start() {
        startMainFlow()
    }
    
    func startMainFlow() { }
}
