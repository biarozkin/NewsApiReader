//
//  NewsSourceCell.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import UIKit

protocol NewsSourceCellType {
    func set(name: String, description: String)
}
 
class NewsSourceCell: UITableViewCell, TableViewNibCell {
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}

// MARK: - NewsSourceCellType
extension NewsSourceCell: NewsSourceCellType {
    
    func set(name: String, description: String) {
        nameLabel.text = name
        descriptionLabel.text = description
    }
}
