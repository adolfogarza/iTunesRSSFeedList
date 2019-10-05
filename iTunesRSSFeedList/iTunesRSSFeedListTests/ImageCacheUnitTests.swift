//
//  ImageCacheUnitTests.swift
//  iTunesRSSFeedListTests
//
//  Created by MacBook Pro 13 on 10/5/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import XCTest
@testable import iTunesRSSFeedList

class ImageCacheUnitTests: XCTestCase {

    func testImageCacheStoresAndReturnsImageObject() {
        let expectedUIImageReference = UIImage()
        let storageKey = "customImageKey" as NSString
        ImageCache.shared.setImage(expectedUIImageReference, ForKey: storageKey)
        
        if let returnedUIImageForKey = ImageCache.shared.image(forKey: storageKey) {
            XCTAssertEqual(expectedUIImageReference, returnedUIImageForKey)
        } else {
            XCTFail()
        }
    }
    
}
