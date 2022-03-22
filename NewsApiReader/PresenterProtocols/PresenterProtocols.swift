//
//  PresenterProtocols.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import Foundation

protocol RowsCountSupportable {
    func numberOfRowsIn(section: Int) -> Int
}

protocol RowSelectable {
    func didSelectRowAt(indexPath: IndexPath)
}

@objc protocol ViewLifecycleSupportable {
    @objc optional func viewDidLoad()
    @objc optional func viewWillAppear()
    @objc optional func viewDidAppear()
    @objc optional func viewWillDisappear()
}
