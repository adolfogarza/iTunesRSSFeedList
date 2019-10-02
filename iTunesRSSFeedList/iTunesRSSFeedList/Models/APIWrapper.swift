//
//  APIWrapper.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/2/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation

struct APIWrapper: Codable {
    var feed: APIWrapperFeed
}

struct APIWrapperFeed: Codable {
    var results: [Album]
}
