//
//  ArticleDetailsCell.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/22/22.
//

import UIKit

protocol ArticleDetailsCellType {
    func set(articleViewModel: ArticleViewModel)
    func set(title: String, description: String, date: String, imageUrl: URL?)
}
 
final class ArticleDetailsCell: UITableViewCell, TableViewNibCell {
    
    // MARK: - Outlets
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        articleImageView.image = nil
    }
}

// MARK: - NewsSourceCellType
extension ArticleDetailsCell: ArticleDetailsCellType {
    
    func set(articleViewModel: ArticleViewModel) {
        set(title: articleViewModel.title,
            description: articleViewModel.description,
            date: articleViewModel.articleDate,
            imageUrl: articleViewModel.imageUrl)
    }
    
    func set(title: String, description: String, date: String, imageUrl: URL?) {
        titleLabel.text = title
        descriptionLabel.text = description
        dateLabel.text = date
        
        if let imageUrl = imageUrl {
            articleImageView.setImageWith(URL: imageUrl)
        }
    }
}
