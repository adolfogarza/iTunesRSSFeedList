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
    func pinToParentEdges(shouldUseTopMarginsGuide: Bool = false, shouldUseBottomMarginsGuide: Bool = false) {
        guard let superview = self.superview else { return }
        let superViewTopAnchor = shouldUseTopMarginsGuide ? superview.layoutMarginsGuide.topAnchor : superview.topAnchor
        let superViewBottomAnchor = shouldUseBottomMarginsGuide ? superview.layoutMarginsGuide.bottomAnchor : superview.bottomAnchor
        
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superViewTopAnchor).isActive = true
        leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superViewBottomAnchor).isActive = true
    }
    
    func constraintTo(topAnchor: NSLayoutYAxisAnchor? = nil,
                      bottomAnchor: NSLayoutYAxisAnchor? = nil,
                      leftAnchor: NSLayoutXAxisAnchor? = nil,
                      rightAnchor: NSLayoutXAxisAnchor? = nil,
                      verticalCenterAnchor: NSLayoutYAxisAnchor? = nil,
                      horizontalCenterAnchor: NSLayoutXAxisAnchor? = nil,
                      equalWidths: NSLayoutDimension? = nil,
                      equalWidthsMultiplier: CGFloat? = nil,
                      width: CGFloat = 0.0,
                      height: CGFloat = 0.0,
                      topPadding: CGFloat = 0.0,
                      bottomPadding: CGFloat = 0.0,
                      leftPadding: CGFloat = 0.0,
                      rightPadding: CGFloat = 0.0,
                      topAnchorPriority: Float = 1000,
                      bottomAnchorPriority: Float = 1000,
                      leftAnchorPriority: Float = 1000,
                      rightAnchorPriority: Float = 1000,
                      widthPriority: Float = 1000,
                      heightPriority: Float = 1000) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let topAnchor = topAnchor {
            let topAnchorConstraint = self.topAnchor.constraint(equalTo: topAnchor, constant: topPadding)
            topAnchorConstraint.priority = UILayoutPriority(topAnchorPriority)
            topAnchorConstraint.isActive = true
        }
        
        if let bottomAnchor = bottomAnchor {
            let bottomAnchorConstraint = self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomPadding)
            bottomAnchorConstraint.priority = UILayoutPriority(bottomAnchorPriority)
            bottomAnchorConstraint.isActive = true
        }
        
        if let leftAnchor = leftAnchor {
            let leftAnchorConstraint = self.leftAnchor.constraint(equalTo: leftAnchor, constant: leftPadding)
            leftAnchorConstraint.priority = UILayoutPriority(leftAnchorPriority)
            leftAnchorConstraint.isActive = true
        }
        
        if let rightAnchor = rightAnchor {
            let rightAnchorConstraint = self.rightAnchor.constraint(equalTo: rightAnchor, constant: -rightPadding)
            rightAnchorConstraint.priority = UILayoutPriority(rightAnchorPriority)
            rightAnchorConstraint.isActive = true
        }
        
        if width > 0.0 {
            let widthAnchorConstraint = widthAnchor.constraint(equalToConstant: width)
            widthAnchorConstraint.priority = UILayoutPriority(widthPriority)
            widthAnchorConstraint.isActive = true
        }
        
        if height > 0.0 {
            let heightAnchorConstraint = heightAnchor.constraint(equalToConstant: height)
            heightAnchorConstraint.priority = UILayoutPriority(heightPriority)
            heightAnchorConstraint.isActive = true
        }
        
        if let verticalCenterAnchor = verticalCenterAnchor {
            centerYAnchor.constraint(equalTo: verticalCenterAnchor).isActive = true
        }
        
        if let horizontalCenterAnchor = horizontalCenterAnchor {
            centerXAnchor.constraint(equalTo: horizontalCenterAnchor).isActive = true
        }
        
        if let equalWidths = equalWidths, let equalWidthsMultiplier = equalWidthsMultiplier {
            widthAnchor.constraint(equalTo: equalWidths, multiplier: equalWidthsMultiplier).isActive = true
        }
    }
}
