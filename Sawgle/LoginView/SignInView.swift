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

    let titleLabel: UILabel = {
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
        UITextField().makeTextField(placeHoldText: "ID")
    }()

    let passwordTextField: UITextField = {
        UITextField().makeTextField(placeHoldText: "Password")
    }()

    let signInLabel: UILabel = {
        let signInLabel = UILabel()
        signInLabel.backgroundColor = UIColor.white
        signInLabel.clipsToBounds = true
        signInLabel.layer.cornerRadius = 10.0
        signInLabel.font = UIFont().mainFont(displaySize: 24)
        signInLabel.text = "로그인"
        signInLabel.textAlignment = .center
        signInLabel.textColor = UIColor(named: "brownishGray")
        return signInLabel
    }()

    let signInButton: UIButton = {
        UIButton()
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
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 0.0).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
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

    func makeSignInLabelConstraint() {
        self.signInLabel.translatesAutoresizingMaskIntoConstraints = false
        self.signInLabel.topAnchor.constraint(equalTo: self.textFiedlStackView.bottomAnchor, constant: 20).isActive = true
        self.signInLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        self.signInLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        self.signInLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.066).isActive = true
    }

    func makeSignInButtonConstraint() {
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false
        self.signInButton.widthAnchor.constraint(equalTo: self.signInLabel.widthAnchor).isActive = true
        self.signInButton.heightAnchor.constraint(equalTo: self.signInLabel.heightAnchor).isActive = true
        self.signInButton.centerXAnchor.constraint(equalTo: self.signInLabel.centerXAnchor).isActive = true
        self.signInButton.centerYAnchor.constraint(equalTo: self.signInLabel.centerYAnchor).isActive = true
    }

    func makeBackButtionConstraint() {
        self.backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
    }

    func addViewItemInSignInView() {
        addSubview(self.logoImageView)
        addSubview(self.titleLabel)
        addSubview(self.textFiedlStackView)
        addSubview(self.signInLabel)
        addSubview(self.signInButton)
        addSubview(self.backButton)
    }

    func makeStackView() {
        self.textFiedlStackView.addArrangedSubview(self.idTextField)
        self.textFiedlStackView.addArrangedSubview(self.passwordTextField)
    }

    func makeViewItemConstraint() {
        self.makeLogoImageViewConstraint()
        self.makeTitleLabelConstrinat()
        self.makeTextFieldStackConstraint()
        self.makeIdTextFieldConstraint()
        self.makeSignInLabelConstraint()
        self.makeBackButtionConstraint()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Pale")
        self.addViewItemInSignInView()
        self.makeStackView()
        self.makeViewItemConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension UITextField {
    func makeTextField(placeHoldText: String) -> UITextField {
        self.backgroundColor = UIColor(named: "lightPeach")
        self.layer.cornerRadius = 10.0
        self.textAlignment = .center
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center

        self.attributedPlaceholder = NSAttributedString(string: placeHoldText, attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 20, weight: .regular), .paragraphStyle: paragraphStyle])

        guard let category = TextFieldCategory(rawValue: placeHoldText) else {
            return UITextField()
        }

        switch category {
        case .id:
            self.isSecureTextEntry = false
        case .password:
            self.isSecureTextEntry = true
        }

        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        self.leftView = leftView
        self.leftViewMode = .always

        let newPosition = self.beginningOfDocument
        self.selectedTextRange = self.textRange(from: newPosition, to: newPosition)

        return self
    }
}
