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
    private var tableView = UITableView()
    weak var delegate: AlbumListViewControllerDelegate?
    var viewModel: AlbumListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerDesignPreferences()
        setupTableView()
        viewModel?.delegate = self
        viewModel?.fetchAlbumDataSource()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.isUserInteractionEnabled = true
    }
    
    private func setupViewControllerDesignPreferences() {
        self.view.backgroundColor = UIColor.white
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.pinToParentEdges(shouldUseTopMarginsGuide: true)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
    }
}

extension AlbumListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.albumDataSource.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier, for: indexPath) as? AlbumTableViewCell,
            let model = viewModel?.albumDataSource[indexPath.row] else {
                return UITableViewCell()
        }
        
        
        cell.bind(model: model)
        return cell
    }
}

extension AlbumListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedAlbum = viewModel?.albumDataSource[indexPath.row] else { return }
        tableView.isUserInteractionEnabled = false
        delegate?.didSelectAlbum(selectedAlbum)
    }
}

extension AlbumListViewController: AlbumListViewModelDelegate {
    func didUpdateAlbumDataSource() {
        tableView.reloadData()
    }
}
