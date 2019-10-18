//
//  Constants.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/2/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let albumListTitle = NSLocalizedString("albumListTitle", comment: "")
    static let albumDetailTitle = NSLocalizedString("albumDetailTitle", comment: "")
    static let iTunesButtonTitle = NSLocalizedString("iTunesButtonTitle", comment: "")
    static let artistName = NSLocalizedString("artistName", comment: "")
    static let albumName = NSLocalizedString("albumName", comment: "")
    static let copyright = NSLocalizedString("copyright", comment: "")
    static let genres = NSLocalizedString("genres", comment: "")
    static let releaseDate = NSLocalizedString("releaseDate", comment: "")
    static let endpointURL = "https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/100/explicit.json"
    static let preferredAlbumArtworkHeightInList: CGFloat = 150.0
    static let preferredAlbumArtworkHeightInDetail: CGFloat = 250.0
}
