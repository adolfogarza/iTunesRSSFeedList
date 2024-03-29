//
//  NetworkRequest.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/2/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkRequest: class {
    associatedtype Model
    func load(withCompletion completion: @escaping (Result<Model, Error>) -> Void)
    func decode(_ data: Data) -> (Result<Model, Error>)
}

extension NetworkRequest {
    fileprivate func request(_ url: URL, withCompletion completion: @escaping (Result<Model, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let self = self else {
                completion(.failure(NetworkError.missingNetworkRequestInstance))
                return
            }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.missingData))
                return
            }
            
            DispatchQueue.main.async {
                completion(self.decode(data))
            }
        })
        
        task.resume()
    }
}

final class APIWrapperRequest: NetworkRequest {
    func load(withCompletion completion: @escaping (Result<APIWrapper, Error>) -> Void) {
        guard let iTunesTopAlbumsURL = URL(string: Constants.endpointURL) else {
            completion(.failure(NetworkError.invalidEndpointURL))
            return
        }
        
        request(iTunesTopAlbumsURL, withCompletion: completion)
    }
    
    func decode(_ data: Data) -> (Result<APIWrapper, Error>) {
        do {
            let wrapper = try JSONDecoder().decode(APIWrapper.self, from: data)
            return .success(wrapper)
        } catch {
            return .failure(error)
        }
    }
}

final class ImageRequest: NetworkRequest {
    var imageURLString: String
    
    init(_ imageURLString: String) {
        self.imageURLString = imageURLString
    }
    
    func load(withCompletion completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let imageURL = URL(string: imageURLString) else {
            completion(.failure(NetworkError.invalidImageURL))
            return
        }
        
        if let cachedImage = ImageCache.shared.image(forKey: imageURLString as NSString) {
            completion(.success(cachedImage))
        } else {
            request(imageURL, withCompletion: completion)
        }
    }
    
    func decode(_ data: Data) -> (Result<UIImage, Error>) {
        guard let imageFromData = UIImage(data: data) else {
            return .failure(NetworkError.misformedImageFromData)
        }
        
        ImageCache.shared.setImage(imageFromData, ForKey: imageURLString as NSString)
        return .success(imageFromData)
    }
}
