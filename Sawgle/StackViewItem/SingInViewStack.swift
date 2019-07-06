//
//  SingInViewStack.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 03/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class SingInViewStackItem: UIView {
    let stackItem: UIStackView = {
        UIStackView()
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
