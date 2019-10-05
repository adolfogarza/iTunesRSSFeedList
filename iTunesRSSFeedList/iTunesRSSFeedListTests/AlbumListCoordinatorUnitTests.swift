//
//  AlbumListCoordinatorUnitTests.swift
//  iTunesRSSFeedListTests
//
//  Created by MacBook Pro 13 on 10/5/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import XCTest
@testable import iTunesRSSFeedList

class AlbumListCoordinatorUnitTests: XCTestCase {

    func testAlbumListCoordinatorPresentsAlbumListViewController() {
        let rootNavigationController = UINavigationController()
        let albumListCoordinator = AlbumListCoordinator(presenter: rootNavigationController, viewModel: AlbumListViewModel())
        
        albumListCoordinator.start()
        
        if let topViewController = rootNavigationController.topViewController {
            XCTAssertTrue(topViewController is AlbumListViewController)
        } else {
            XCTFail()
        }
    }
    
}
