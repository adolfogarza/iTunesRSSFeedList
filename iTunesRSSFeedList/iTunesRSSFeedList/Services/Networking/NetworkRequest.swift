//
//  NetworkRequest.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/2/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation

protocol NetworkRequest: class {
    associatedtype Model
    func load(withCompletion completion: @escaping (Result<Model, Error>) -> Void)
    func decode(_ data: Data) -> Model
}

extension NetworkRequest {
    func request(_ url: URL, withCompletion completion: @escaping (Result<Model, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data, let self = self else {
                completion(.failure(NetworkError.missingData))
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(self.decode(data)))
            }
        })
        
        task.resume()
    }
}
