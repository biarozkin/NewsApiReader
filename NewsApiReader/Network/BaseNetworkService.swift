//
//  BaseNetworkService.swift
//  NewsApiReader
//
//  Created by Igor Biarozkin on 3/20/22.
//

import Foundation

enum EndpointPath: String {
    case allSources = "v2/top-headlines/sources"
    case bySource = "/v2/everything"
}

enum RequestResult {
    case failure(error: String)
    case value(data: Data, code: Int)
}

class BaseNetworkService {
    
    // MARK: - Private properties
    private let successNetworkCodesRange = NetworkCodes.success.rawValue...299
    private let baseURLString: String
    private let token: String
    
    // MARK: - Init
    init() {
        self.baseURLString = "https://newsapi.org/"
        self.token = "143799e303f24d9690db184e40f94baf" // FIXME: - Save token using keychain
    }
    
    func sendRequest(endPoint: EndpointPath,
                     completion: @escaping (RequestResult) -> Void) {
        // FYI. URLRequest was used to save token in a secure way into HTTP header.
        // https://newsapi.org/docs/authentication
        guard let urlRequest = makeURLRequest(endPointPath: endPoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, urlResponse, error in
            guard let self = self else { return }
                  
            guard let response = urlResponse,
                  let castedResponse = response as? HTTPURLResponse,
                  let responseData = data else { return }
            
            let statusCode = castedResponse.statusCode
            switch statusCode {
            case self.successNetworkCodesRange:
                DispatchQueue.main.async {
                    completion(.value(data: responseData, code: statusCode))
                }
            // TODO: - Add error handling
            default:
                DispatchQueue.main.async {
                    completion(.failure(error: "Some error"))
                }
            }
        }
        task.resume()
    }

    private func makeURLRequest(endPointPath: EndpointPath) -> URLRequest? {
        guard let url = buildURL(baseURLString: baseURLString,
                                 endpointPath: endPointPath.rawValue) else { return nil }
        let withToken = addToken(url: url)
        return withToken
    }
    
    private func addToken(url: URL) -> URLRequest? {
        var request = URLRequest(url: url)
        // FIXME: - Use keychain to save token securely.
        request.allHTTPHeaderFields = [HeaderKeys.token.rawValue: token]
        return request
    }
    
    private func buildURL(baseURLString: String,
                          endpointPath: String) -> URL? {
        return URL(string: baseURLString + endpointPath)
    }
}

