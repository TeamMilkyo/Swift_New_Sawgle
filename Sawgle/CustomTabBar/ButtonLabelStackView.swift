//
//  ButtonLabelStack.swift
//  Sawgle
//
//  Created by Milkyo on 27/07/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class ButtonLabelStackView: UIView {
    let buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fill
        return buttonStackView
    }()

    let button: UIButton = {
        UIButton()
    }()

    let buttonTitle: UILabel = {
        let firstButtonLabel = UILabel()
        firstButtonLabel.font = UIFont.mainFont(displaySize: 15)
        firstButtonLabel.textColor = ColorList.brownish
        firstButtonLabel.contentMode = .center
        firstButtonLabel.textAlignment = .center
        return firstButtonLabel
    }()

    func makeButtonStackViewConstraint() {
        self.buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.widthAnchor.constraint(equalTo: widthAnchor),
            buttonStackView.heightAnchor.constraint(equalTo: heightAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    func makeButtonConstraint() {
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

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

extension ButtonLabelStackView: UIViewItemProtocol {
    func makeSubView() {
        addSubview(self.buttonStackView)
    }

    func makeSubViewConstraint() {
        self.makeButtonStackViewConstraint()
        self.makeButtonConstraint()
    }
}

extension ButtonLabelStackView: StackViewItemProtocol {
    func makeStackView() {
        self.buttonStackView.addArrangedSubview(self.button)
        self.buttonStackView.addArrangedSubview(self.buttonTitle)
    }
}
