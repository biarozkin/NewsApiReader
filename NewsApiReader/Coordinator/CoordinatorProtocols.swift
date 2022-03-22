//
//  CoordinatorProtocols.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import UIKit

protocol Coordinatable: class {
    func start()
}

protocol Presentable: class {
    var toPresent: UIViewController? { get }
}

extension UIViewController: Presentable {
    var toPresent: UIViewController? { return self }
}
