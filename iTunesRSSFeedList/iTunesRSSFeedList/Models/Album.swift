//
//  Album.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/2/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation

struct Album: Codable {
    var artistName: String?
    var name: String
    var artworkURL: String?
    var copyright: String?
    var albumURL: String?
    var genres: [Genre]?
    var releaseDate: String?
    
    var albumGenres: String? {
        return genres?.map { $0.name }.joined(separator: ", ")
    }
    
    private enum CodingKeys: String, CodingKey {
        case artistName
        case name
        case artworkURL = "artworkUrl100"
        case copyright
        case albumURL = "url"
        case genres
        case releaseDate
    }
    
    enum DescriptorText: String {
        case artistName = "Artist Name"
        case name = "Album Name"
        case copyright = "Copyright"
        case genres = "Genres"
        case releaseDate = "Release Date"
    }
}
