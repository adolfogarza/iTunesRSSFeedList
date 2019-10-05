//
//  GridGenerator.swift
//  iTunesRSSFeedList
//
//  Created by MacBook Pro 13 on 10/4/19.
//  Copyright © 2019 Adolfo. All rights reserved.
//

import Foundation
import UIKit

struct GridElement {
    var title: String?
    var value: String?
    var axisOrientation: NSLayoutConstraint.Axis
    var elementSpacing: CGFloat
    var valueTextAlignment: NSTextAlignment
}

extension GridElement: Equatable {
    static func == (lhs: GridElement, rhs: GridElement) -> Bool {
        return
            lhs.title == rhs.title &&
                lhs.value == rhs.value &&
                lhs.axisOrientation == rhs.axisOrientation &&
                lhs.elementSpacing == rhs.elementSpacing &&
                lhs.valueTextAlignment == rhs.valueTextAlignment
    }
}

protocol GridConfiguration {
    var gridElements: [GridElement] { get }
    var elementSpacing: CGFloat { get }
}

class GridGenerator {
    func createStackViewGrid(fromGridConfiguration gridConfiguration: GridConfiguration) -> UIStackView {
        let mainVerticalStackView = UIStackView()
        
        mainVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        mainVerticalStackView.axis = .vertical
        mainVerticalStackView.spacing = gridConfiguration.elementSpacing
        mainVerticalStackView.alignment = .fill
        mainVerticalStackView.distribution = .equalSpacing
        
        for gridElement in gridConfiguration.gridElements {
            let titleLabel = GridTitleLabel()
            let valueLabel = GridValueLabel()
            
            titleLabel.text = gridElement.title
            valueLabel.text = gridElement.value
            valueLabel.textAlignment = gridElement.valueTextAlignment
            
            let elementStackView = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
            elementStackView.translatesAutoresizingMaskIntoConstraints = false
            elementStackView.axis = gridElement.axisOrientation
            elementStackView.spacing = gridElement.elementSpacing
            elementStackView.alignment = .top
            elementStackView.distribution = .fillProportionally
            
            mainVerticalStackView.addArrangedSubview(elementStackView)
            mainVerticalStackView.addArrangedSubview(GridSeparatorView())
        }
        
        return mainVerticalStackView
    }
}
