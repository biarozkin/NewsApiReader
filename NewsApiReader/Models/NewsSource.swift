//
//  NewsSource.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/21/22.
//

import Foundation

struct NewsSource: Decodable {
    let id: String
    let name: String
    let description: String
}
