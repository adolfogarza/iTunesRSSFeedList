//
//  AlbumDetailViewModel.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/3/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation

final class AlbumDetailViewModel {
    let albumDataSource: Album
    
    init(withAlbumModel albumDataSource: Album) {
        self.albumDataSource = albumDataSource
    }
}
