//
//  SourceArticlesAssembly.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import UIKit

struct SourceArticlesAssembly {
    
    static func build(with newsSource: NewsSourceViewModel) -> (view: SourceArticlesController,
                                                                presenter: ISourceArticlesPresenter) {
        let view = UIStoryboard.main.load(SourceArticlesController.self)
        let presenter = SourceArticlesPresenter(newsSource: newsSource,
                                                view: view,
                                                networkService: ServiceLocator.shared.resolve())
        view.presenter = presenter

        return (view, presenter)
    }
}
