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
        let albumNameGridElement = GridElement(title: Album.LabelNames.name.localizedString, value: album.name, axisOrientation: .horizontal, elementSpacing: 5, valueTextAlignment: .right)
        let artistNameGridElement = GridElement(title: Album.LabelNames.artistName.localizedString, value: album.artistName, axisOrientation: .horizontal, elementSpacing: 5, valueTextAlignment: .right)
        let releaseDateGridElement = GridElement(title: Album.LabelNames.releaseDate.localizedString, value: album.releaseDate, axisOrientation: .horizontal, elementSpacing: 5, valueTextAlignment: .right)
        let genresGridElement = GridElement(title: Album.LabelNames.genres.localizedString, value: album.albumGenres, axisOrientation: .vertical, elementSpacing: 15, valueTextAlignment: .left)
        let copyrightGridElement = GridElement(title: Album.LabelNames.copyright.localizedString, value: album.copyright, axisOrientation: .vertical, elementSpacing: 15, valueTextAlignment: .left)
        
        return [albumNameGridElement, artistNameGridElement, releaseDateGridElement, genresGridElement, copyrightGridElement]
    }
    
    var elementSpacing: CGFloat {
        return 10
    }
    
    init(album: Album) {
        self.album = album
    }
}
