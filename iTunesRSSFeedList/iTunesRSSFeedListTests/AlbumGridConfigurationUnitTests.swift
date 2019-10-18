//
//  AlbumGridConfigurationUnitTests.swift
//  iTunesRSSFeedListTests
//
//  Created by MacBook Pro 13 on 10/5/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import XCTest
@testable import iTunesRSSFeedList

class AlbumGridConfigurationUnitTests: XCTestCase {
    
    func testAlbumGridConfigurationElementsEqualExpectedElementsFromAlbumModel() {
        let album = Album(artistName: "Micheal Jackson", name: "Thriller", artworkURL: nil, copyright: "Micheal Jackson", albumURL: nil, genres: nil, releaseDate: "1982-11-30")
        
        let albumNameGridElement = GridElement(title: Album.LabelNames.name.rawValue, value: album.name, axisOrientation: .horizontal, elementSpacing: 5, valueTextAlignment: .right)
        let artistNameGridElement = GridElement(title: Album.LabelNames.artistName.rawValue, value: album.artistName, axisOrientation: .horizontal, elementSpacing: 5, valueTextAlignment: .right)
        let releaseDateGridElement = GridElement(title: Album.LabelNames.releaseDate.rawValue, value: album.releaseDate, axisOrientation: .horizontal, elementSpacing: 5, valueTextAlignment: .right)
        let genresGridElement = GridElement(title: Album.LabelNames.genres.rawValue, value: album.albumGenres, axisOrientation: .vertical, elementSpacing: 15, valueTextAlignment: .left)
        let copyrightGridElement = GridElement(title: Album.LabelNames.copyright.rawValue, value: album.copyright, axisOrientation: .vertical, elementSpacing: 15, valueTextAlignment: .left)
        
        let currentAlbumGridConfigurationElements = AlbumGridConfiguration(album: album).gridElements
        
        let expectedAlbumGridConfigurationElements = [albumNameGridElement, artistNameGridElement, releaseDateGridElement, genresGridElement, copyrightGridElement]
        
        XCTAssertEqual(currentAlbumGridConfigurationElements, expectedAlbumGridConfigurationElements)
    }

}
