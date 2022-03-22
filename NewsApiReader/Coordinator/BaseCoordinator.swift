//
//  BaseCoordinator.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/20/22.
//

import Foundation

class BaseCoordinator: NSObject, Coordinatable {
    
    private var childrens: [Coordinatable]
    
    override init() {
        childrens = [Coordinatable]()
        
        super.init()
    }
    
    func start() { }
    
    // MARK: - Manage dependencies
    func add(_ child: Coordinatable) {
        for element in childrens {
            if child === element { return }
        }
        childrens.append(child)
    }
    
    func remove(_ child: Coordinatable) {
        guard !childrens.isEmpty else { return }
        for (index, element) in childrens.enumerated() {
            if element === child {
                childrens.remove(at: index)
                break
            }
        }
    }
}
