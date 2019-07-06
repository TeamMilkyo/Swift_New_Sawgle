//
//  extensionLabel.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 02/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

extension UILabel {
    func makeTitleLabel(titleText: String, titleSize: CGFloat, titleColor: UIColor) -> UILabel {
        self.font = UIFont().mainFont(displaySize: titleSize)
        self.text = titleText
        self.textColor = titleColor
        return self
    }
}
