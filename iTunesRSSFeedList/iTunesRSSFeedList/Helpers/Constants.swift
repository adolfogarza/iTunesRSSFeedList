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
    static let albumListTitle = "iTunes Top Albums"
    static let albumDetailTitle = "Album Details"
    static let iTunesButtonTitle = "Go To iTunes Page"
    static let endpointURL = "https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/100/explicit.json"
    static let preferredAlbumArtworkHeightInList: CGFloat = 150.0
    static let preferredAlbumArtworkHeightInDetail: CGFloat = 250.0
}
