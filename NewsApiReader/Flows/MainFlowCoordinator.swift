//
//  MainFlowCoordinator.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/20/22.
//

import Foundation

final class MainFlowCoordinator: NSObject, Coordinatable {
    
    // MARK: - Properties
    private let router: Routable
    
    // MARK: - Init
    required init(router: Routable) {
        self.router = router
        
        super.init()
    }
    
    // MARK: - Coordinatable
    func start() {
        showSources()
    }
}

// MARK: - Flow
private extension MainFlowCoordinator {

    func showSources() {
        let module = NewsSourcesAssembly.build()
        let view = module.view
        let presenter = module.presenter
        presenter.onSourceSelected = { sourceViewModel in
            self.showSelectedSourceArticles(with: sourceViewModel)
        }
        router.setRootModule(view)
    }
    
    func showSelectedSourceArticles(with source: NewsSourceViewModel) {
        let module = SourceArticlesAssembly.build(with: source)
        let view = module.view
        let presenter = module.presenter
        presenter.onArticleSelected = { articleViewModel in
            self.showSelectedArticle(with: articleViewModel)
        }
        router.push(view, animated: true)
    }
    
    func showSelectedArticle(with article: ArticleViewModel) {
        let module = ArticleDetailsAssembly.build(with: article)
        let view = module.view
        router.push(view, animated: true)
    }
}
