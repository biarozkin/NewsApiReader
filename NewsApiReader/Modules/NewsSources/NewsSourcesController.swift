//
//  NewsSourcesController.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/20/22.
//

import UIKit

protocol INewsSourcesView: Reloadable { }

final class NewsSourcesController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
        
    // MARK: - Public properties
    var presenter: INewsSourcesPresenter!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUI()
        presenter.getSources()
    }
}

// MARK: - INewsSourcesView
extension NewsSourcesController: INewsSourcesView {
    
    func reload() {
        // TODO: - Add showing/hiding HUD while loading/receiving data
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension NewsSourcesController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsIn(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithRegistration(type: NewsSourceCell.self,
                                                                 indexPath: indexPath)
        presenter.configure(view: cell, at: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension NewsSourcesController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter.didSelectRowAt(indexPath: indexPath)
    }
}

// MARK: - Private methods
private extension NewsSourcesController {
    
    func prepareUI() {
        // TODO: - Add localization support
        title = "News sources"
        tableView.tableFooterView = UIView()
    }
}

