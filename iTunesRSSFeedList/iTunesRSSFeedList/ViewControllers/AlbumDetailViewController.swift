//
//  AlbumDetailViewController.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/3/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import UIKit

final class AlbumDetailViewController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: AlbumDetailViewModel?
    private var albumImageView: UIImageView?
    private var contentView: UIView?
    private var scrollView: UIScrollView?
    private var albumDetailGridStackView: UIStackView?
    private var albumDetailActionButton: AlbumActionButton?
    private var preferredButtonPadding: CGFloat = 20
    
    // MARK: View Controller Lifecycle
    
    override func loadView() {
        view = UIView()
        setupUIPropertiesAndLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.fetchAlbumArtworkImage() { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let albumImage):
                self.albumImageView?.image = albumImage
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupButtonTopConstraintIfContentViewHeightIsSmallerThanScrollViewHeight()
    }
    
    // MARK: UI Properties Main Setup
    
    private func setupUIPropertiesAndLayout() {
        setupScrollViewPropertiesAndLayout()
        setupContentViewPropertiesAndLayout()
        setupAlbumImageViewPropertiesAndLayout()
        setupAlbumDetailInformationStackViewPropertiesAndLayout()
        setupAlbumDetailActionButtonPropertiesAndLayout()
    }
    
    // MARK: Setup UI Element Properties And Layout
    
    private func setupScrollViewPropertiesAndLayout() {
        view.backgroundColor = .white
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.bounces = true
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.constraintTo(topAnchor: view.layoutMarginsGuide.topAnchor, bottomAnchor: view.layoutMarginsGuide.bottomAnchor, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor)
        
        self.scrollView = scrollView
    }
    
    private func setupContentViewPropertiesAndLayout() {
        guard let scrollView = scrollView else { return }
        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.constraintTo(topAnchor: scrollView.topAnchor, bottomAnchor: scrollView.bottomAnchor, leftAnchor: scrollView.leftAnchor, rightAnchor: scrollView.rightAnchor, equalWidths: view.widthAnchor, equalWidthsMultiplier: 1.0)
        contentView.backgroundColor = .white
        
        self.contentView = contentView
    }
    
    private func setupAlbumImageViewPropertiesAndLayout() {
        guard let contentView = contentView else { return }
        let albumImageView = UIImageView()
        contentView.addSubview(albumImageView)
        albumImageView.constraintTo(topAnchor: contentView.topAnchor, horizontalCenterAnchor: contentView.centerXAnchor, width: Constants.preferredAlbumArtworkHeightInDetail, height: Constants.preferredAlbumArtworkHeightInDetail, topPadding: 20.0)
        albumImageView.contentMode = .scaleAspectFit
        albumImageView.clipsToBounds = true
        
        self.albumImageView = albumImageView
    }
    
    private func setupAlbumDetailInformationStackViewPropertiesAndLayout() {
        guard let albumDetailGridStackView = viewModel?.albumDetailGridStackView,
            let contentView = contentView, let albumImageView = albumImageView else { return }
        contentView.addSubview(albumDetailGridStackView)
        albumDetailGridStackView.constraintTo(topAnchor: albumImageView.bottomAnchor, leftAnchor: contentView.leftAnchor, rightAnchor: contentView.rightAnchor, topPadding: 40, leftPadding: 20, rightPadding: 20)
        
        self.albumDetailGridStackView = albumDetailGridStackView
    }
    
    private func setupAlbumDetailActionButtonPropertiesAndLayout() {
        guard let contentView = contentView, let albumDetailGridStackView = albumDetailGridStackView else { return }
        let albumDetailActionButton = AlbumActionButton()
        albumDetailActionButton.addTarget(self, action: #selector(albumButtonAction(sender:)), for: .touchUpInside)
        contentView.addSubview(albumDetailActionButton)
        
        albumDetailActionButton.constraintTo(topAnchor: albumDetailGridStackView.bottomAnchor, bottomAnchor: contentView.bottomAnchor, leftAnchor: contentView.leftAnchor, rightAnchor: contentView.rightAnchor, height: 40, topPadding: preferredButtonPadding, bottomPadding: preferredButtonPadding, leftPadding: preferredButtonPadding, rightPadding: preferredButtonPadding, topAnchorPriority: 999)
        
        self.albumDetailActionButton = albumDetailActionButton
    }
    
    private func setupButtonTopConstraintIfContentViewHeightIsSmallerThanScrollViewHeight() {
        guard let viewModel = viewModel else { return }
        
        viewModel.setupButtonTopConstraintIfContentViewHeightIsSmallerThanScrollViewHeight(albumDetailActionButton: albumDetailActionButton, albumDetailGridStackView: albumDetailGridStackView, scrollView: scrollView, contentView: contentView, preferredButtonPadding: preferredButtonPadding)
    }
    
    // MARK: Setup UI Element Actions
    
    @objc private func albumButtonAction(sender: UIButton) {
        guard let viewModel = viewModel else { return }
        viewModel.presentAlbumAppleMusicDetailPage()
    }
}
