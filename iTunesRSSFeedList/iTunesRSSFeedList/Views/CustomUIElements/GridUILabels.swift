//
//  GridUILabels.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/4/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

class GridTitleLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    private func commonInit() {
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        textColor = .lightGray
        font = UIFont.systemFont(ofSize: 16)
    }
}

class GridValueLabel: UILabel {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    private func commonInit() {
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .right
        textColor = .black
        font = UIFont.systemFont(ofSize: 16)
    }
}
