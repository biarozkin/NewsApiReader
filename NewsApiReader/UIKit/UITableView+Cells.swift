//
//  UITableView+Cells.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCellWithRegistration<T: TableViewNibCell>(type: T.Type, indexPath: IndexPath) -> T {
        let identifier = T.identifier
        if let cell = dequeueReusableCell(withIdentifier: identifier) as? T {
            return cell
        }
        
        register(T.nib, forCellReuseIdentifier: identifier)
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }
}
