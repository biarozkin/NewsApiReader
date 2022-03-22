//
//  ArticleDetailsCell.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/22/22.
//

import UIKit

protocol ArticleDetailsCellType {
    func set(articleViewModel: ArticleViewModel)
    func set(title: String, description: String, date: String, imageUrl: String)
}
 
final class ArticleDetailsCell: UITableViewCell, TableViewNibCell {
    
    // MARK: - Outlets
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}

// MARK: - NewsSourceCellType
extension ArticleDetailsCell: ArticleDetailsCellType {
    
    func set(articleViewModel: ArticleViewModel) {
        set(title: articleViewModel.title,
            description: articleViewModel.description,
            date: articleViewModel.articleDate,
            imageUrl: articleViewModel.imageUrl)
    }
    
    func set(title: String, description: String, date: String, imageUrl: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        dateLabel.text = date
//        articleImageView.image = image
    }
}
