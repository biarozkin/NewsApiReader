//
//  ArticleDetailsController.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/22/22.
//

import UIKit

protocol IArticleDetailsView: class {
    func updateUI(with article: ArticleViewModel)
}

final class ArticleDetailsController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Public properties
    var presenter: IArticleDetailsPresenter!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad?()
    }
}

// MARK: - IArticleDetailsView
extension ArticleDetailsController: IArticleDetailsView {

    func updateUI(with article: ArticleViewModel) {
        title = "Article description"               // TODO: - Localize
        if let articleURL = article.imageUrl {
            articleImageView.setImageWith(URL: articleURL)
        }
        dateLabel.text = article.articleDate        // FIXME: - Use DateFormatter
        titleLabel.text = article.title
        descriptionLabel.text = article.description
    }
}


