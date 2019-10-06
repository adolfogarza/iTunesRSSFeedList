//
//  AlbumListViewController.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/1/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import UIKit

protocol AlbumListViewControllerDelegate: class {
    func didSelectAlbum(_ album: Album)
}

final class AlbumListViewController: UIViewController {
    
    // MARK: Properties
    
    private var tableView: UITableView?
    private var customActivityIndicatorView: CustomActivityIndicatorView?
    weak var delegate: AlbumListViewControllerDelegate?
    var viewModel: AlbumListViewModel?
    
    // MARK: View Controller Lifecycle
    
    override func loadView() {
        view = UIView()
        setupUIPropertiesAndLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModelAndStartupLogic()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView?.isUserInteractionEnabled = true
    }
    
    // MARK: UI Properties Main Setup
    
    private func setupUIPropertiesAndLayout() {
        setupViewProperties()
        setupTableViewPropertiesAndLayout()
        setupActivityIndicatorPropertiesAndLayout()
    }
    
    // MARK: View Model Setup And Startup Logic
    
    private func setupViewModelAndStartupLogic() {
        viewModel?.delegate = self
        viewModel?.fetchAlbumDataSource()
    }
    
    // MARK: UI Element Property And Layout Setup
    
    private func setupViewProperties() {
        self.view.backgroundColor = UIColor.white
    }
    
    private func setupTableViewPropertiesAndLayout() {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.pinToParentEdges(shouldUseTopMarginsGuide: true,
                                   shouldUseBottomMarginsGuide: true)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
        self.tableView = tableView
    }
    
    private func setupActivityIndicatorPropertiesAndLayout() {
        let customActivityIndicatorView = CustomActivityIndicatorView()
        view.addSubview(customActivityIndicatorView)
        customActivityIndicatorView.pinToParentEdges(shouldUseTopMarginsGuide: true,
                                                     shouldUseBottomMarginsGuide: true)
        customActivityIndicatorView.startAnimating()
        self.customActivityIndicatorView = customActivityIndicatorView
    }
}

// MARK: UITableViewDataSource Protocol Conformance

extension AlbumListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.albumCollectionDataSource.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let albumCell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier, for: indexPath) as? AlbumTableViewCell,
            let model = viewModel?.albumCollectionDataSource[indexPath.row] else {
                return UITableViewCell()
        }
        
        albumCell.bind(model: model)
        return albumCell
    }
}

// MARK: UITableViewDelegate Protocol Conformance

extension AlbumListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedAlbum = viewModel?.albumCollectionDataSource[indexPath.row] else { return }
        tableView.isUserInteractionEnabled = false
        delegate?.didSelectAlbum(selectedAlbum)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: AlbumListViewModelDelegate Protocol Conformance

extension AlbumListViewController: AlbumListViewModelDelegate {
    func didUpdateAlbumDataSource() {
        customActivityIndicatorView?.stopAnimating()
        customActivityIndicatorView?.isHidden = true
        tableView?.reloadData()
    }
}
