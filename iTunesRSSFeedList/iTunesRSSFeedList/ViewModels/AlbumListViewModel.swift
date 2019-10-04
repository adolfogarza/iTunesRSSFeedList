//
//  AlbumListViewModel.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/2/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation

protocol AlbumListViewModelDelegate: class {
    func didUpdateAlbumDataSource()
}

final class AlbumListViewModel {
    var albumCollectionDataSource: [Album] = []
    weak var delegate: AlbumListViewModelDelegate?
    private var wrapperAPIRequest: APIWrapperRequest?
    
    func fetchAlbumDataSource() {
        wrapperAPIRequest = APIWrapperRequest()
        wrapperAPIRequest?.load() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let wrapper):
                self.albumCollectionDataSource = wrapper.feed.results
                self.delegate?.didUpdateAlbumDataSource()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
