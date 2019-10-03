//
//  AlbumTableViewCell.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/2/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import UIKit

final class AlbumTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    static let identifier = "AlbumTableViewCell"
    private let albumNameLabel = UILabel()
    private let artistNameLabel = UILabel()
    private let albumImageView = UIImageView()
    private var imageRequest: ImageRequest?
    
    // MARK: Overriding And Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAlbumNameLabelProperties()
        setupArtistNameLabelProperties()
        
        setupAlbumImageViewLayout()
        setupAlbumInformationViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        artistNameLabel.text = nil
        albumNameLabel.text = nil
        albumImageView.image = nil
    }
    
    // MARK: UI Element Property Setup
    
    private func setupArtistNameLabelProperties() {
        artistNameLabel.numberOfLines = 1
        artistNameLabel.textAlignment = .left
        artistNameLabel.textColor = .black
        artistNameLabel.font = UIFont.systemFont(ofSize: 17)
    }
    
    private func setupAlbumNameLabelProperties() {
        albumNameLabel.numberOfLines = 2
        albumNameLabel.textAlignment = .left
        albumNameLabel.textColor = .black
        albumNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func setupAlbumImageViewProperties() {
        albumImageView.contentMode = .scaleAspectFit
        albumImageView.clipsToBounds = true
    }
    
    // MARK: UI Element Layout Setup
    
    private func setupAlbumImageViewLayout() {
        addSubview(albumImageView)
        albumImageView.constraintTo(topAnchor: topAnchor, bottomAnchor: bottomAnchor, leftAnchor: leftAnchor, rightAnchor: nil, width: Constants.preferredAlbumArtworkHeightInList, height: Constants.preferredAlbumArtworkHeightInList, topPadding: 5, bottomPadding: 5, leftPadding: 15, bottomAnchorPriority: 999)
    }
    
    private func setupAlbumInformationViewLayout() {
        let albumInformationView = UIView()
        albumInformationView.addSubview(albumNameLabel)
        albumInformationView.addSubview(artistNameLabel)
        addSubview(albumInformationView)
        
        albumNameLabel.constraintTo(topAnchor: albumInformationView.topAnchor, leftAnchor: albumInformationView.leftAnchor, rightAnchor: albumInformationView.rightAnchor, topPadding: 5, leftPadding: 5, rightPadding: 5)
        
        artistNameLabel.constraintTo(topAnchor: albumNameLabel.bottomAnchor, bottomAnchor: albumInformationView.bottomAnchor, leftAnchor: albumInformationView.leftAnchor, rightAnchor: albumInformationView.rightAnchor, topPadding: 5, bottomPadding: 5, leftPadding: 5, rightPadding: 5)
        
        albumInformationView.constraintTo(leftAnchor: albumImageView.rightAnchor, rightAnchor: rightAnchor, verticalCenterAnchor: albumImageView.centerYAnchor, leftPadding: 10, rightPadding: 25)
    }
    
    // MARK: Model Bind
    
    func bind(model: Album) {
        albumNameLabel.text = model.name
        artistNameLabel.text = model.artistName
        
        if let imageURLString = model.artworkURL {
            imageRequest = ImageRequest(imageURLString)
            imageRequest?.load() { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let albumImage):
                    self.albumImageView.image = albumImage
                    self.setupAlbumImageViewProperties()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
