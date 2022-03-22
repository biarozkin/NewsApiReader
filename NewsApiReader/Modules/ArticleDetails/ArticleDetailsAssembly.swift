//
//  ArticleDetailsAssembly.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/22/22.
//

import UIKit

struct ArticleDetailsAssembly {
    
    static func build(with article: ArticleViewModel) -> (view: ArticleDetailsController,
                                                          presenter: IArticleDetailsPresenter) {
        let view = UIStoryboard.main.load(ArticleDetailsController.self)
        let presenter = ArticleDetailsPresenter(article: article,
                                                view: view)
        view.presenter = presenter
        
        return (view, presenter)
    }
}
