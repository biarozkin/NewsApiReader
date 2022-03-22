//
//  ArticleDetailsPresenter.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/22/22.
//

import Foundation

protocol IArticleDetailsPresenter: ViewLifecycleSupportable { }

final class ArticleDetailsPresenter {
    
    // MARK: - Public properties
    weak var view: IArticleDetailsView?
    
    // MARK: - Private properties
    private let articleViewModel: ArticleViewModel
    
    // MARK: - Init
    init(article: ArticleViewModel,
         view: IArticleDetailsView) {
        self.articleViewModel = article
        self.view = view
    }
}

// MARK: - IArticleDetailsPresenter
extension ArticleDetailsPresenter: IArticleDetailsPresenter {
    
    func viewDidLoad() {
        view?.updateUI(with: articleViewModel)
    }

}
