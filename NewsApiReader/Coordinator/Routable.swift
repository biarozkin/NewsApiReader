//
//  Routable.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import Foundation

protocol Routable: Presentable {
    func push(_ module: Presentable?, animated: Bool)
    func setRootModule(_ module: Presentable?)
}
