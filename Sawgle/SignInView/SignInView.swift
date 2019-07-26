//
//  SignInViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 02/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

enum TextFieldCategory: String {
    case id = "ID"
    case password = "Password"
}

class SignInView: UIView {
    let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logo")
        return logoImageView
    }()

    let signInTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont().mainFont(displaySize: 60)
        titleLabel.text = "Sawgle"
        titleLabel.textColor = .white
        return titleLabel
    }()

    let textFiedlStackView: UIStackView = {
        let textFiedlStackView = UIStackView()
        textFiedlStackView.axis = NSLayoutConstraint.Axis.vertical
        textFiedlStackView.distribution = UIStackView.Distribution.fillEqually
        textFiedlStackView.spacing = 10.0
        return textFiedlStackView
    }()

    let idTextField: UITextField = {
        UITextField()
    }()

    let passwordTextField: UITextField = {
        UITextField()
    }()

    let signInButton: UIButton = {
        if let buttonColor = ColorList.brownishGray {
            return UIButton().makeDefaultButton(title: "로그인", titleColor: buttonColor, backgrondColor: .white)
        }

        return UIButton().makeDefaultButton(title: "로그인", titleColor: .black, backgrondColor: .white)
    }()

    let backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "Back"), for: .normal)
        return backButton
    }()

    func makeLogoImageViewConstraint() {
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.logoImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.17).isActive = true
        self.logoImageView.widthAnchor.constraint(equalTo: self.logoImageView.heightAnchor, multiplier: 1.15).isActive = true
        self.logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 18).isActive = true
        NSLayoutConstraint(item: self.logoImageView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY,
                           multiplier: 0.6,
                           constant: 0).isActive = true
    }

    func makeTitleLabelConstrinat() {
        self.signInTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.signInTitleLabel.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 0.0).isActive = true
        self.signInTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    func makeTextFieldStackConstraint() {
        self.textFiedlStackView.translatesAutoresizingMaskIntoConstraints = false
        self.textFiedlStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        NSLayoutConstraint(item: self.textFiedlStackView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY,
                           multiplier: 1.2,
                           constant: 0.0).isActive = true
        self.textFiedlStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        self.textFiedlStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }

    func makeIdTextFieldConstraint() {
        self.idTextField.translatesAutoresizingMaskIntoConstraints = false
        self.idTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
    }

    func makeSignInButtonlConstraint() {
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false
        self.signInButton.topAnchor.constraint(equalTo: self.textFiedlStackView.bottomAnchor, constant: 20).isActive = true
        self.signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        self.signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        self.signInButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.066).isActive = true
    }

    func makeBackButtionConstraint() {
        self.backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
    }

    func makeSubView() {
        addSubview(self.logoImageView)
        addSubview(self.signInTitleLabel)
        addSubview(self.textFiedlStackView)
        addSubview(self.signInButton)
        addSubview(self.backButton)
    }

    func makeStackView() {
        self.textFiedlStackView.addArrangedSubview(self.idTextField)
        self.textFiedlStackView.addArrangedSubview(self.passwordTextField)
    }

    func makeSubViewContraint() {
        self.makeLogoImageViewConstraint()
        self.makeTitleLabelConstrinat()
        self.makeTextFieldStackConstraint()
        self.makeIdTextFieldConstraint()
        self.makeSignInButtonlConstraint()
        self.makeBackButtionConstraint()
    }

    func makeTextField(target: UITextField, placeHoldText: String) {
        target.backgroundColor = ColorList.lightPeach
        target.layer.cornerRadius = 10.0
        target.textAlignment = .center
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        target.attributedPlaceholder = NSAttributedString(string: placeHoldText, attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 20, weight: .regular), .paragraphStyle: paragraphStyle])

        guard let category = TextFieldCategory(rawValue: placeHoldText) else {
            return
        }

        switch category {
        case .id:
            target.isSecureTextEntry = false
        case .password:
            target.isSecureTextEntry = true
        }

        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        target.leftView = leftView
        target.leftViewMode = .always

        let newPosition = target.beginningOfDocument
        target.selectedTextRange = target.textRange(from: newPosition, to: newPosition)
    }

    func linkActionInSignInView() {
        self.backButton.addTarget(SignInViewController(), action: #selector(SignInViewController.dismissViewController), for: .touchUpInside)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorList.pale
        self.makeSubView()
        self.makeStackView()
        self.makeSubViewContraint()
        self.makeTextField(target: self.idTextField, placeHoldText: "ID")
        self.makeTextField(target: self.passwordTextField, placeHoldText: "Password")
        self.linkActionInSignInView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
