//
//  NibCell.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import Foundation

import UIKit

protocol TableViewNibCell: NibLoadableView,
                           ReusableView where Self: UITableViewCell {
}
