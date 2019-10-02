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
    var viewModel = AlbumListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        viewModel.delegate = self
        setupTableView()
        viewModel.fetchAlbumDataSource()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.pinToParentEdges(shouldUseTopMarginsGuide: true)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension AlbumListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albumDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.albumDataSource[indexPath.row].name
        return cell
    }
}

extension AlbumListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AlbumListViewController: AlbumListViewModelDelegate {
    func didUpdateAlbumDataSource(_ albumDataSource: [Album]) {
        tableView.reloadData()
    }
}
