//
//  UIStoryboard+Extension.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import UIKit

extension UIStoryboard {
    static let main = UIStoryboard(name: "Main", bundle: nil)
}

extension UIStoryboard {
    func load<T: UIViewController>(_ type: T.Type) -> T {
        let idenitifer = String(describing: T.self)
        return instantiateViewController(withIdentifier: idenitifer) as! T
    }
}


