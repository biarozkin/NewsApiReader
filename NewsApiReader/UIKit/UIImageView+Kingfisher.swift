//
//  UIImageView+Kingfisher.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/22/22.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageWith(URL: URL, placeholder: UIImage? = nil) {
        kf.setImage(with: URL, placeholder: placeholder)
    }
}
