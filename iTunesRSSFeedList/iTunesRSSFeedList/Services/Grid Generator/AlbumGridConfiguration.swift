//
//  AlbumGridConfiguration.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/4/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

struct AlbumGridConfiguration: GridConfiguration {
    var album: Album
    var gridElements: [GridElement] {
        let albumNameGridElement = GridElement(title: Album.DescriptorText.name.rawValue, value: album.name, axisOrientation: .horizontal, elementSpacing: 5, valueTextAlignment: .right)
        let artistNameGridElement = GridElement(title: Album.DescriptorText.artistName.rawValue, value: album.artistName, axisOrientation: .horizontal, elementSpacing: 5, valueTextAlignment: .right)
        let releaseDateGridElement = GridElement(title: Album.DescriptorText.releaseDate.rawValue, value: album.releaseDate, axisOrientation: .horizontal, elementSpacing: 5, valueTextAlignment: .right)
        let genresGridElement = GridElement(title: Album.DescriptorText.genres.rawValue, value: album.albumGenres, axisOrientation: .vertical, elementSpacing: 15, valueTextAlignment: .left)
        let copyrightGridElement = GridElement(title: Album.DescriptorText.copyright.rawValue, value: album.copyright, axisOrientation: .vertical, elementSpacing: 15, valueTextAlignment: .left)
        
        return [albumNameGridElement, artistNameGridElement, releaseDateGridElement, genresGridElement, copyrightGridElement]
    }
    
    var elementSpacing: CGFloat {
        return 10
    }
    
    init(album: Album) {
        self.album = album
    }
}
