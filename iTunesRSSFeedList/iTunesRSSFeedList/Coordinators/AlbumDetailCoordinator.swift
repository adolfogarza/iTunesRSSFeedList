//
//  AlbumDetailCoordinator.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/3/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

final class AlbumDetailCoordinator: Coordinator {
    private let presenter: UINavigationController
    private let viewModel: AlbumDetailViewModel
    private var albumDetailViewController: AlbumDetailViewController?
    
    init(presenter: UINavigationController, viewModel: AlbumDetailViewModel) {
        self.presenter = presenter
        self.viewModel = viewModel
    }
    
    func start() {
        let albumDetailViewController = AlbumDetailViewController(nibName: nil, bundle: nil)
        albumDetailViewController.viewModel = viewModel
        albumDetailViewController.title = Constants.albumDetailTitle
        presenter.pushViewController(albumDetailViewController, animated: true)
        self.albumDetailViewController = albumDetailViewController
    }
}
