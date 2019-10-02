//
//  AlbumListViewModel.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/2/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation

protocol AlbumListViewModelDelegate: class {
    func didUpdateAlbumDataSource(_ albumDataSource: [Album])
}

class AlbumListViewModel {
    var albumDataSource: [Album] = []
    weak var delegate: AlbumListViewModelDelegate?
    private var wrapperAPIRequest: APIWrapperRequest?
    
    func fetchAlbumDataSource() {
        wrapperAPIRequest = APIWrapperRequest()
        wrapperAPIRequest?.load() {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let wrapper):
                let albumCollection = wrapper.feed.results
                self.albumDataSource = albumCollection
                self.delegate?.didUpdateAlbumDataSource(albumCollection)
            case .failure(let error):
                print(error)
            }
        }
    }
}
