//
//  RequestConstants.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/20/22.
//

import Foundation

enum HeaderKeys: String {
    case token = "Authorization"
}

enum NetworkCodes: Int {
    case success = 200
    // TODO: - Describe other situations.
}
