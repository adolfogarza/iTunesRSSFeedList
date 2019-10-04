//
//  NetworkingError.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/2/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case missingData
    case missingNetworkRequestInstance
    case invalidEndpointURL
    case invalidImageURL
    case misformedImageFromData
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("The requested data object is nil", comment: "missing data")
        case .missingNetworkRequestInstance:
            return NSLocalizedString("The network request instance is nil (this could happen while scrolling or going away from an async operation, in that case this is not an error)", comment: "missing instance")
        case .invalidEndpointURL:
            return NSLocalizedString("The provided endpoint URL is invalid", comment: "invalid endpoint URL")
        case .invalidImageURL:
            return NSLocalizedString("The provided image URL is invalid", comment: "invalid image URL")
        case .misformedImageFromData:
            return NSLocalizedString("The provided data cannot form an image", comment: "missformed image from data")
        }
    }
}
