//
//  SourcesPresenter.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/20/22.
//

import Foundation

protocol INewsSourcesPresenter: class, RowsCountSupportable, RowSelectable {
    var onSourceSelected: ((NewsSourceViewModel) -> Void)? { get set }
    
    func getSources()
    func configure(view: NewsSourceCellType, at path: IndexPath)
}

final class NewsSourceViewModel {
    let id: String
    let title: String
    let description: String
    
    required init(id: String,
                  title: String,
                  description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
}

final class NewsSourcesPresenter {
    
    // MARK: - Public properties
    var onSourceSelected: ((NewsSourceViewModel) -> Void)?
    weak var view: INewsSourcesView?
    
    // MARK: - Private properties
    private let networkService: IRequestsNetworkService
    private var viewModels = [NewsSourceViewModel]()
    
    // MARK: - Init
    init(view: INewsSourcesView, networkService: IRequestsNetworkService) {
        self.view = view
        self.networkService = networkService
    }
}

// MARK: - INewsSourcesPresenter
extension NewsSourcesPresenter: INewsSourcesPresenter {
    
    func getSources() {
        networkService.getSources { [weak self] sources in
            guard let self = self else { return }
            
            self.viewModels = sources.map { NewsSourceViewModel(id: $0.id,
                                                                title: $0.name,
                                                                description: $0.description) }
            // FIXME: - Add pagination logic
            self.view?.reload()
        }
    }
    
    func configure(view: NewsSourceCellType, at path: IndexPath) {
        guard path.row >= 0 && path.row < viewModels.count else { return }
        
        let viewModel = viewModels[path.row]
        view.set(name: viewModel.title, description: viewModel.description)
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return viewModels.count
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        onSourceSelected?(viewModels[indexPath.row])
    }
}

