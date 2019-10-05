//
//  AlbumDetailViewModel.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/3/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

final class AlbumDetailViewModel {
    let albumDataSource: Album
    private var imageRequest: ImageRequest?
    
    var albumDetailGridStackView: UIStackView {
        let albumGridConfiguration = AlbumGridConfiguration(album: albumDataSource)
        let albumGridGenerator = GridGenerator()
        let albumDetailGridStackView = albumGridGenerator.createStackViewGrid(fromGridConfiguration: albumGridConfiguration)
        return albumDetailGridStackView
    }
    
    init(withAlbumModel albumDataSource: Album) {
        self.albumDataSource = albumDataSource
    }
    
    func presentAlbumAppleMusicDetailPage() {
        guard let albumURLString = albumDataSource.albumURL,
            let albumURL = URL(string: albumURLString) else { return }
        
        UIApplication.shared.open(albumURL)
    }
    
    func fetchAlbumArtworkImage(withCompletion completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let imageURLString = albumDataSource.artworkURL else {
            completion(.failure(NetworkError.invalidImageURL))
            return
        }
        
        imageRequest = ImageRequest(imageURLString)
        imageRequest?.load(withCompletion: completion)
    }
    
    func setupButtonTopConstraintIfContentViewHeightIsSmallerThanScrollViewHeight(albumDetailActionButton: AlbumActionButton, albumDetailGridStackView: UIStackView, scrollView: UIScrollView, contentView: UIView, preferredButtonPadding: CGFloat) {
        let scrollViewHeight = scrollView.frame.size.height
        let contentViewHeight = contentView.frame.size.height
        let heightDelta = scrollViewHeight - contentViewHeight
        
        if heightDelta > 0, contentViewHeight > 0  {
            let topPadding = heightDelta + preferredButtonPadding
            albumDetailActionButton.topAnchor.constraint(equalTo: albumDetailGridStackView.bottomAnchor, constant: topPadding).isActive = true
        }
    }
}
