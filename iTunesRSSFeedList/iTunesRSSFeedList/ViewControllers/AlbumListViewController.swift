//
//  AlbumListViewController.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/1/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import UIKit

final class AlbumListViewController: UIViewController {
    
    private var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        setupTableView()
    }
    
    private func setupTableView() {
        tableView = UITableView()
        guard let tableView = tableView else { return }
        
        view.addSubview(tableView)
        tableView.pinToParentEdges(shouldUseTopMarginsGuide: true)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension AlbumListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Album Name"
        return cell
    }
}
