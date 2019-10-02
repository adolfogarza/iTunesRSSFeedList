//
//  AlbumListCoordinator.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/2/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

final class AlbumListCoordinator: Coordinator {
    private let presenter: UINavigationController
    private let viewModel: AlbumListViewModel
    private var albumListViewController: AlbumListViewController?
    
    init(presenter: UINavigationController, viewModel: AlbumListViewModel) {
        self.presenter = presenter
        self.viewModel = viewModel
    }
    
    func start() {
        let albumListViewController = AlbumListViewController(nibName: nil, bundle: nil)
        albumListViewController.viewModel = viewModel
        albumListViewController.title = Constants.albumListTitle
        albumListViewController.delegate = self
        presenter.pushViewController(albumListViewController, animated: true)
        self.albumListViewController = albumListViewController
    }
}

extension AlbumListCoordinator: AlbumListViewControllerDelegate {
    func didSelectAlbum(_ album: Album) {
        print("album: \(album.name)")
    }
}
