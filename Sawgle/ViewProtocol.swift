//
//  ViewProtocol.swift
//  Sawgle
//
//  Created by Milkyo on 27/07/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import Foundation

protocol UIViewItemProtocol {
    func makeSubView()
    func makeSubViewConstraint()
}

protocol ActionProtocol {
    func linkAction()
}

protocol StackViewItemProtocol {
    func makeStackView()
}

protocol CellProtocol {
    func registerCell()
}
