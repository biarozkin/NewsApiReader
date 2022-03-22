//
//  SourceArticlesController.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import UIKit

protocol ISourceArticlesView: Reloadable {
    func updateUI(with title: String)
}

final class SourceArticlesController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public properties
    var presenter: ISourceArticlesPresenter!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        presenter.viewDidLoad?()
    }
}

// MARK: - ISourceArticlesView
extension SourceArticlesController: ISourceArticlesView {
    
    func updateUI(with title: String) {
        self.title = title
    }
    
    func reload() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension SourceArticlesController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsIn(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithRegistration(type: ArticleDetailsCell.self,
                                                                 indexPath: indexPath)
        presenter.configure(view: cell, at: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SourceArticlesController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        presenter.didSelectRowAt(indexPath: indexPath)
    }
}

// MARK: - Private methods
private extension SourceArticlesController {
    
    func prepareUI() {
        tableView.tableFooterView = UIView()
    }
}
