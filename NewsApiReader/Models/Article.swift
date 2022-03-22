//
//  Article.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/22/22.
//

import Foundation

struct Article: Decodable {
    let title: String
    let description: String
    let publishedAt: String
    let urlToImage: String
}
