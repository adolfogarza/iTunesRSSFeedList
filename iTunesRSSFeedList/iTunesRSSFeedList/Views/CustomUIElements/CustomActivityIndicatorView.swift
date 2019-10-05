//
//  CustomActivityIndicatorView.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/5/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

class CustomActivityIndicatorView: UIView {
    private var activityIndicator = UIActivityIndicatorView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        backgroundColor = .white
        addSubview(activityIndicator)
        activityIndicator.pinToParentEdges()
    }
    
    func startAnimating() {
        activityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicator.stopAnimating()
    }
}
