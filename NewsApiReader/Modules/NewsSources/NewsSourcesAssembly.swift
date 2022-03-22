//
//  SourcesAssembly.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/20/22.
//

import UIKit

struct NewsSourcesAssembly {
    
    static func build() -> (view: NewsSourcesController,
                            presenter: INewsSourcesPresenter) {
        let view = UIStoryboard.main.load(NewsSourcesController.self)
        let presenter = NewsSourcesPresenter(view: view,
                                             networkService: ServiceLocator.shared.resolve())
        view.presenter = presenter

        return (view, presenter)
    }
}
