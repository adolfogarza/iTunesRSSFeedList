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
    private var albumDetailInformationStackView: UIStackView?
    private var imageRequest: ImageRequest?
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupAlbumImageViewPropertiesAndLayout()
        setupAlbumDetailInformationStackViewPropertiesAndLayout()
    }
    
    // MARK: Setup UI Element Properties And Layout
    
    private func setupAlbumImageViewPropertiesAndLayout() {
        view.addSubview(albumImageView)
        
        albumImageView.constraintTo(topAnchor: view.layoutMarginsGuide.topAnchor, horizontalCenterAnchor: view.centerXAnchor, width: Constants.preferredAlbumArtworkHeightInDetail, height: Constants.preferredAlbumArtworkHeightInDetail, topPadding: 20.0)
        
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
        
//        let actionButton = UIButton()
//        actionButton.setTitleColor(.white, for: .normal)
//        actionButton.setTitle("Press Me", for: .normal)
//        actionButton.backgroundColor = .red
//
//        view.addSubview(actionButton)
//
//        actionButton.constraintTo(bottomAnchor: view.bottomAnchor, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, bottomPadding: 20, leftPadding: 20, rightPadding: 20)
//
//        actionButton.topAnchor.constraint(greaterThanOrEqualTo: albumDetailInformationStackView.bottomAnchor, constant: 20).isActive = true
        
        guard let albumModel = viewModel?.albumDataSource else { return }
        
        let albumGridConfiguration = AlbumGridConfiguration(album: albumModel)
        let gridGenerator = GridGenerator()
        
        let mainAlbumGridStackView = gridGenerator.createStackViewGrid(fromGridConfiguration: albumGridConfiguration)
        
        view.addSubview(mainAlbumGridStackView)
        mainAlbumGridStackView.constraintTo(topAnchor: albumImageView.bottomAnchor, bottomAnchor: nil, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, topPadding: 40, bottomPadding: 100 ,leftPadding: 30, rightPadding: 30)
        
    }
    
    func gridGenerator() {
        
    }
}
