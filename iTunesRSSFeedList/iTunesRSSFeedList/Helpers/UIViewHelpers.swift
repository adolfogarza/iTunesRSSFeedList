//
//  UIViewHelpers.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/2/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func pinToParentEdges(shouldUseTopMarginsGuide: Bool = false) {
        guard let superview = self.superview else { return }
        let superViewTopAnchor = shouldUseTopMarginsGuide ? superview.layoutMarginsGuide.topAnchor : superview.topAnchor
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superViewTopAnchor).isActive = true
        leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
}
