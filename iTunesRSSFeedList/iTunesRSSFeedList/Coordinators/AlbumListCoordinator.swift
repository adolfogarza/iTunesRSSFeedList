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
    private var albumListViewController: AlbumListViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let albumListViewController = AlbumListViewController(nibName: nil, bundle: nil)
        albumListViewController.title = Constants.albumListTitle
        presenter.pushViewController(albumListViewController, animated: true)
        self.albumListViewController = albumListViewController
    }
}
