//
//  ReusableView.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import UIKit

protocol ReusableView {
    static var identifier: String { get }
}

extension ReusableView where Self: UIView {
    static var identifier: String { return String(describing: self) }
}

protocol Reloadable: AnyObject {
    func reload()
}
