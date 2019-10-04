//
//  AlbumDetailViewController.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/3/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: AlbumDetailViewModel?
    private var albumImageView = UIImageView()
    private var contentView = UIView()
    private var scrollView = UIScrollView()
    private var albumDetailGridStackView: UIStackView?
    private var albumDetailActionButton: UIButton?
    private var imageRequest: ImageRequest?
    private var preferredButtonPadding: CGFloat = 20
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupScrollViewPropertiesAndLayout()
        setupContentViewPropertiesAndLayout()
        setupAlbumImageViewPropertiesAndLayout()
        setupAlbumDetailInformationStackViewPropertiesAndLayout()
        setupAlbumDetailActionButtonPropertiesAndLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupButtonTopConstraintIfContentViewHeightIsSmallerThanScrollView()
    }
    
    // MARK: Setup UI Element Properties And Layout
    
    private func setupScrollViewPropertiesAndLayout() {
        view.addSubview(scrollView)
        scrollView.bounces = true
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.constraintTo(topAnchor: view.layoutMarginsGuide.topAnchor, bottomAnchor: view.bottomAnchor, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor)
    }
    
    private func setupContentViewPropertiesAndLayout() {
        scrollView.addSubview(contentView)
        contentView.constraintTo(topAnchor: scrollView.topAnchor, bottomAnchor: scrollView.bottomAnchor, leftAnchor: scrollView.leftAnchor, rightAnchor: scrollView.rightAnchor, equalWidths: view.widthAnchor, equalWidthsMultiplier: 1.0)
        contentView.backgroundColor = .white
    }
    
    private func setupAlbumImageViewPropertiesAndLayout() {
        contentView.addSubview(albumImageView)
        
        albumImageView.constraintTo(topAnchor: contentView.topAnchor, horizontalCenterAnchor: contentView.centerXAnchor, width: Constants.preferredAlbumArtworkHeightInDetail, height: Constants.preferredAlbumArtworkHeightInDetail, topPadding: 20.0)
        
        self.albumImageView.contentMode = .scaleAspectFit
        self.albumImageView.clipsToBounds = true
        
        if let imageURLString = viewModel?.albumDataSource.artworkURL {
            imageRequest = ImageRequest(imageURLString)
            imageRequest?.load() { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let albumImage):
                    self.albumImageView.image = albumImage
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func setupAlbumDetailInformationStackViewPropertiesAndLayout() {
        guard let albumModel = viewModel?.albumDataSource else { return }
        let albumGridConfiguration = AlbumGridConfiguration(album: albumModel)
        let albumDetailGridStackView = GridGenerator().createStackViewGrid(fromGridConfiguration: albumGridConfiguration)
        
        contentView.addSubview(albumDetailGridStackView)
        albumDetailGridStackView.constraintTo(topAnchor: albumImageView.bottomAnchor, leftAnchor: contentView.leftAnchor, rightAnchor: contentView.rightAnchor, topPadding: 40 ,leftPadding: 30, rightPadding: 30)
        
        self.albumDetailGridStackView = albumDetailGridStackView
    }
    
    private func setupAlbumDetailActionButtonPropertiesAndLayout() {
        guard let albumDetailGridStackView = albumDetailGridStackView else { return }
        
        let albumDetailActionButton = UIButton()
        albumDetailActionButton.setTitleColor(.white, for: .normal)
        albumDetailActionButton.setTitle(Constants.iTunesButtonTitle, for: .normal)
        albumDetailActionButton.backgroundColor = .red
        
        contentView.addSubview(albumDetailActionButton)
        
        albumDetailActionButton.constraintTo(topAnchor: albumDetailGridStackView.bottomAnchor, bottomAnchor: contentView.bottomAnchor, leftAnchor: contentView.leftAnchor, rightAnchor: contentView.rightAnchor, topPadding: preferredButtonPadding, bottomPadding: preferredButtonPadding, leftPadding: preferredButtonPadding, rightPadding: preferredButtonPadding, topAnchorPriority: 999)
        
        self.albumDetailActionButton = albumDetailActionButton
    }
    
    private func setupButtonTopConstraintIfContentViewHeightIsSmallerThanScrollView() {
        guard let albumDetailActionButton = albumDetailActionButton,
            let albumDetailGridStackView = albumDetailGridStackView else { return }
        
        let scrollViewHeight = scrollView.frame.size.height
        let contentViewHeight = contentView.frame.size.height
        let heightDelta = scrollViewHeight - contentViewHeight
        
        if heightDelta > 0, contentViewHeight > 0  {
            let topPadding = heightDelta + preferredButtonPadding
            albumDetailActionButton.topAnchor.constraint(equalTo: albumDetailGridStackView.bottomAnchor, constant: topPadding).isActive = true
        }
    }
}
