//
//  AlbumActionUIButton.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/4/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

class AlbumActionButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.pinkTone, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        setTitle(Constants.iTunesButtonTitle, for: .normal)
        backgroundColor = .grayTone
    }
}
