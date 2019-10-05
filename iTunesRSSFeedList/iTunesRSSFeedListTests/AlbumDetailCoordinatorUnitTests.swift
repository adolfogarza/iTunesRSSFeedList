//
//  AlbumDetailCoordinatorUnitTests.swift
//  iTunesRSSFeedListTests
//
//  Created by MacBook Pro 13 on 10/5/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import XCTest
@testable import iTunesRSSFeedList

class AlbumDetailCoordinatorUnitTests: XCTestCase {
    
    func testAlbumDetailCoordinatorPresentsViewControllerWithCorrectViewModelDataSourceAlbum() {
        let album = Album(artistName: "Micheal Jackson", name: "Thriller", artworkURL: nil, copyright: "Micheal Jackson", albumURL: nil, genres: nil, releaseDate: "1982-11-30")
        let rootNavigationController = UINavigationController()
        let albumDetailCoordinator = AlbumDetailCoordinator(presenter: rootNavigationController, viewModel: AlbumDetailViewModel(withAlbumModel: album))
        
        albumDetailCoordinator.start()
        
        if let topViewController = rootNavigationController.topViewController as? AlbumDetailViewController,
            let currentAlbumModel = topViewController.viewModel?.albumDataSource {
            XCTAssertEqual(currentAlbumModel, album)
        } else {
            XCTFail()
        }
        
    }
}
