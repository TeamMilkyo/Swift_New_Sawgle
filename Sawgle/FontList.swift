//
//  FontList.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 02/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

extension UIFont {
    func mainFont(displaySize: CGFloat) -> UIFont {
        if let mainFont = UIFont(name: "SangSangShinb7", size: displaySize) {
            return mainFont
        }
        return UIFont()
    }
}
