//
//  ApplicationCoordinator.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/2/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}

final class ApplicationCoordinator: Coordinator {
    private let window: UIWindow
    private let rootViewController: UINavigationController
    private let albumListCoordinator: AlbumListCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        albumListCoordinator = AlbumListCoordinator(presenter: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        albumListCoordinator.start()
        window.makeKeyAndVisible()
    }
}
