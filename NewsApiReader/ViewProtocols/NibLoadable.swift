//
//  NibLoadable.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import UIKit

protocol NibLoadableView {
    static var nib: UINib { get }
}

extension NibLoadableView where Self: UIView {
    static var nib: UINib {
        let nibName = String(describing: self)
        let nibBundle = Bundle(for: self)
        return UINib(nibName: nibName, bundle: nibBundle)
    }
}
