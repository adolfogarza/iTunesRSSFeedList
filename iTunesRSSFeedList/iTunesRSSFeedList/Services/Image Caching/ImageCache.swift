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
    private let concurrentImageCacheQueue = DispatchQueue(label: "AdolfoGarza.iTunesRSSFeedList.ImageCacheQueue", attributes: .concurrent)
    
    private init() {}
    
    func image(forKey key: NSString) -> UIImage? {
        concurrentImageCacheQueue.sync {
            return cache.object(forKey: key)
        }
    }
    
    func setImage(_ object: UIImage, ForKey key: NSString) {
        concurrentImageCacheQueue.async(flags: .barrier) { [weak self] in
            self?.cache.setObject(object, forKey: key)
        }
    }
}
