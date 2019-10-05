//
//  GridSeparatorView.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/4/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

class GridSeparatorView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        addConstraint(heightAnchor.constraint(equalToConstant: 1))
        backgroundColor = UIColor.lightGray
    }
}
