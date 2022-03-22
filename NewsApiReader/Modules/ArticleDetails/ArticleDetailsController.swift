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
    @IBOutlet weak var linkTextView: UITextView!
    
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
        
        showArticleUrlIfNeeded(with: article)
    }
}

// MARK: - Private methods
private extension ArticleDetailsController {
    
    func showArticleUrlIfNeeded(with article: ArticleViewModel) {
        if let articleUrl = article.articleUrl {
            let attributedString = NSMutableAttributedString(string: "Read Full Article..",     // FIXME: - Localize
                                                             attributes: [NSAttributedString.Key.link: articleUrl])
            linkTextView.attributedText = attributedString
        } else {
            linkTextView.isHidden = true
        }
    }
}


