//
//  Router.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/20/22.
//

import UIKit

final class Router: NSObject, Routable {
    
    // MARK: - Properties
    private weak var rootController: UINavigationController?
    
    var toPresent: UIViewController? {
        return rootController
    }
    
    // MARK: - Init
    required init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    // MARK: - Routable
    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: false)
    }
    
    func setRootModule(_ module: Presentable?, animated: Bool) {
        setRootModule(module, hideBar: false, animated: animated)
    }
    
    func setRootModule(_ module: Presentable?,
                              hideBar: Bool = false,
                              animated: Bool = false) {
        guard let controller = module?.toPresent else { return }
        rootController?.setViewControllers([controller], animated: animated)
        rootController?.isNavigationBarHidden = hideBar
    }
    
    func push(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent,
              !(controller is UINavigationController) else {
            return assertionFailure("⚠️Deprecated push UINavigationController.")
        }
        
        rootController?.pushViewController(controller, animated: animated)
    }
}


