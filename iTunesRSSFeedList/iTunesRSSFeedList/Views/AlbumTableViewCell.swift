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
    private let albumNameLabel = AlbumTitleCellLabel()
    private let artistNameLabel = AlbumSubtitleCellLabel()
    private let albumImageView = UIImageView()
    private var imageRequest: ImageRequest?
    
    // MARK: Overriding And Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAlbumInformationStackViewLayout()
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        artistNameLabel.text = nil
        albumNameLabel.text = nil
        albumImageView.image = nil
        imageRequest = nil
    }
    
    // MARK: UI Element Property Setup
    
    private func setupAlbumImageViewProperties() {
        albumImageView.contentMode = .scaleAspectFill
        albumImageView.layer.cornerRadius = albumImageView.bounds.width / 9
        albumImageView.clipsToBounds = true
    }
    
    // MARK: UI Element Layout Setup
    
    private func setupAlbumInformationStackViewLayout() {
        let albumCellInformationHorizontalStackView = UIStackView()
        albumCellInformationHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        albumCellInformationHorizontalStackView.axis = .horizontal
        albumCellInformationHorizontalStackView.spacing = 15
        albumCellInformationHorizontalStackView.distribution = .fill
        albumCellInformationHorizontalStackView.alignment = .center
        
        let albumDetailsVerticalStackView = UIStackView(arrangedSubviews: [albumNameLabel, artistNameLabel])
        albumDetailsVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        albumDetailsVerticalStackView.axis = .vertical
        albumDetailsVerticalStackView.distribution = .equalSpacing
        albumDetailsVerticalStackView.alignment = .fill
        albumDetailsVerticalStackView.spacing = 5
        
        albumImageView.constraintTo(width: Constants.preferredAlbumArtworkHeightInList, height: Constants.preferredAlbumArtworkHeightInList)
        albumImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        albumCellInformationHorizontalStackView.addArrangedSubview(albumImageView)
        albumCellInformationHorizontalStackView.addArrangedSubview(albumDetailsVerticalStackView)
        
        contentView.addSubview(albumCellInformationHorizontalStackView)
        albumCellInformationHorizontalStackView.constraintTo(topAnchor: contentView.topAnchor, bottomAnchor: contentView.bottomAnchor, leftAnchor: contentView.leftAnchor, rightAnchor: contentView.rightAnchor, topPadding: 10, bottomPadding: 10, leftPadding: 10, rightPadding: 10)
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
