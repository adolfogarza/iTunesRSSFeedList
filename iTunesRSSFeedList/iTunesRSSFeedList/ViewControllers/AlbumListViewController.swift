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
    
    private var tableView = UITableView()
    private var activityIndicatorView = UIView()
    weak var delegate: AlbumListViewControllerDelegate?
    var viewModel: AlbumListViewModel?
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setupTableViewPropertiesAndLayout()
        setupActivityIndicatorPropertiesAndLayout()
        setupViewModelAndFetchData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.isUserInteractionEnabled = true
    }
    
    // MARK: View Model Setup
    
    private func setupViewModelAndFetchData() {
        viewModel?.delegate = self
        viewModel?.fetchAlbumDataSource()
    }
    
    // MARK: UI Element Property And Layout Setup
    
    private func setupViewProperties() {
        self.view.backgroundColor = UIColor.white
    }
    
    private func setupTableViewPropertiesAndLayout() {
        view.addSubview(tableView)
        tableView.pinToParentEdges(shouldUseTopMarginsGuide: true)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
    
    private func setupActivityIndicatorPropertiesAndLayout() {
        view.addSubview(activityIndicatorView)
        activityIndicatorView.pinToParentEdges(shouldUseTopMarginsGuide: true)
        activityIndicatorView.backgroundColor = .white
        let activityIndicator = UIActivityIndicatorView()
        activityIndicatorView.addSubview(activityIndicator)
        activityIndicator.pinToParentEdges()
        activityIndicator.startAnimating()
    }
}

// MARK: UITableViewDataSource Protocol Conformance

extension AlbumListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.albumDataSource.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let albumCell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier, for: indexPath) as? AlbumTableViewCell,
            let model = viewModel?.albumDataSource[indexPath.row] else {
                return UITableViewCell()
        }
        
        albumCell.bind(model: model)
        return albumCell
    }
}

// MARK: UITableViewDelegate Protocol Conformance

extension AlbumListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedAlbum = viewModel?.albumDataSource[indexPath.row] else { return }
        tableView.isUserInteractionEnabled = false
        delegate?.didSelectAlbum(selectedAlbum)
    }
}

// MARK: AlbumListViewModelDelegate Protocol Conformance

extension AlbumListViewController: AlbumListViewModelDelegate {
    func didUpdateAlbumDataSource() {
        activityIndicatorView.isHidden = true
        tableView.reloadData()
    }
}
