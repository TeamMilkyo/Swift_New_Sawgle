//
//  LabelExtension.swift
//  Sawgle
//
//  Created by Milkyo on 27/07/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

extension UIButton {
    func makeDefaultButton(title: String, titleColor: UIColor, backgrondColor: UIColor) -> UIButton {
        self.backgroundColor = backgrondColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 10.0
        self.titleLabel?.font = UIFont.mainFont(displaySize: 24)
        self.setTitle(title, for: .normal)
        self.titleLabel?.textAlignment = .center
        self.setTitleColor(titleColor, for: .normal)
        return self
    }
}
