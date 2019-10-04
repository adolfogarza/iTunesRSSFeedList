//
//  ImageCache.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/3/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

final class ImageCache {
    static let shared = ImageCache()
    private var cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func image(forKey key: NSString) -> UIImage? {
        return cache.object(forKey: key)
    }
    
    func setImage(_ object: UIImage, ForKey key: NSString) {
        cache.setObject(object, forKey: key)
    }
}
