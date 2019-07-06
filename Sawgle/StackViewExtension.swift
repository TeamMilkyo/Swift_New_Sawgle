//
//  StackViewExtension.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 06/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

extension UIStackView {
    func addBackground(color: UIColor) {
        let colorView = UIView(frame: bounds)
        colorView.backgroundColor = color
        colorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(colorView, at: 0)
    }

    func radiusBackground(color: UIColor, radiusValue: CGFloat) {
        let colorRadiusView = UIView(frame: bounds)
        colorRadiusView.backgroundColor = color
        colorRadiusView.layer.cornerRadius = radiusValue
        colorRadiusView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(colorRadiusView, at: 0)
    }
}
