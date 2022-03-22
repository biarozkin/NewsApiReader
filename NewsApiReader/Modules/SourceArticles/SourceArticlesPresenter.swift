//
//  SourceArticlesPresenter.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import Foundation

protocol ISourceArticlesPresenter: ViewLifecycleSupportable,
                                   RowsCountSupportable,
                                   RowSelectable {
    func configure(view: ArticleDetailsCellType, at path: IndexPath)
}

final class ArticleViewModel {
    let title: String
    let description: String
    let articleDate: String     // TODO: - Convert to Date with DateFormat
    let imageUrl: URL?
    
    required init(title: String,
                  description: String,
                  articleDate: String,
                  imageUrl: URL?) {
        self.title = title
        self.description = description
        self.articleDate = articleDate
        self.imageUrl = imageUrl
    }
}

final class SourceArticlesPresenter {
    
    // MARK: - Public properties
    var onArticleSelected: ((ArticleViewModel) -> Void)?
    weak var view: ISourceArticlesView?
    
    // MARK: - Private properties
    private let newsSource: NewsSourceViewModel
    private let networkService: IRequestsNetworkService
    private var viewModels = [ArticleViewModel]()
    
    // MARK: - Init
    init(newsSource: NewsSourceViewModel,
         view: ISourceArticlesView,
         networkService: IRequestsNetworkService) {
        self.newsSource = newsSource
        self.view = view
        self.networkService = networkService
    }
}

// MARK: - ISourceArticlesPresenter
extension SourceArticlesPresenter: ISourceArticlesPresenter {
    
    func viewDidLoad() {
        view?.updateUI(with: newsSource.title)
        getArticles()
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return viewModels.count
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        onArticleSelected?(viewModels[indexPath.row])
    }
    
    func configure(view: ArticleDetailsCellType, at path: IndexPath) {
        guard path.row >= 0 && path.row < viewModels.count else { return }
        
        let viewModel = viewModels[path.row]
        view.set(articleViewModel: viewModel)
    }
}

// MARK: - Private methods
private extension SourceArticlesPresenter {
    
    func getArticles() {
        networkService.getNewsBySource(newsSource.id) { [weak self] articles in
            guard let self = self else { return }
            
            self.viewModels = articles.map { ArticleViewModel(title: $0.title,
                                                              description: $0.description,
                                                              articleDate: $0.publishedAt,
                                                              imageUrl: $0.urlToImage == "null" ? nil : URL(string: $0.urlToImage!)) } // FYI. BackEnd returns "null" string instead of nil for no image
            // FIXME: - Add pagination logic
            self.view?.reload()
        }
    }
}
