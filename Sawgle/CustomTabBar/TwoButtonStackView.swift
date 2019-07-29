//
//  TwoButtonStack.swift
//  Sawgle
//
//  Created by Milkyo on 27/07/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class TwoButtonStackView: UIView {
    let twoButtonStackView: UIStackView = {
        let twoButtonStackView = UIStackView()
        twoButtonStackView.axis = .horizontal
        twoButtonStackView.distribution = .fillEqually
        return twoButtonStackView
    }()

    let leftItemView: UIView = {
        ButtonLabelStackView()
    }()

    let rightItemView: UIView = {
        ButtonLabelStackView()
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeSubView()
        makeSubViewConstraint()
        makeStackView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension TwoButtonStackView: UIViewItemProtocol {
    func makeSubView() {
        addSubview(self.twoButtonStackView)
    }

    func makeSubViewConstraint() {
        self.twoButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            twoButtonStackView.widthAnchor.constraint(equalTo: widthAnchor),
            twoButtonStackView.heightAnchor.constraint(equalTo: heightAnchor),
            twoButtonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            twoButtonStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

extension TwoButtonStackView: StackViewItemProtocol {
    func makeStackView() {
        self.twoButtonStackView.addArrangedSubview(self.leftItemView)
        self.twoButtonStackView.addArrangedSubview(self.rightItemView)
    }
}
