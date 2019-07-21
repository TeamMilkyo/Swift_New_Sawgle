//
//  ViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 02/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class FirstView: UIView {
    let panHeartImageView: UIImageView = {
        let panHeartImaveView = UIImageView()
        panHeartImaveView.image = UIImage(named: "PanHeart")
        return panHeartImaveView
    }()

    let panImageView: UIImageView = {
        let panImageView = UIImageView()
        panImageView.image = UIImage(named: "Pan")
        return panImageView
    }()

    let homeTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont().mainFont(displaySize: 80)
        titleLabel.text = "Sawgle"
        titleLabel.textColor = .white
        return titleLabel
    }()

    let twoButtonStackView: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = NSLayoutConstraint.Axis.vertical
        buttonStack.distribution = UIStackView.Distribution.fillEqually
        buttonStack.spacing = 20.0
        return buttonStack
    }()

    let signInLabel: UILabel = {
        let signInLabel = UILabel()
        signInLabel.backgroundColor = UIColor(named: "Peach")
        signInLabel.clipsToBounds = true
        signInLabel.layer.cornerRadius = 10.0
        signInLabel.font = UIFont().mainFont(displaySize: 24)
        signInLabel.text = "로그인"
        signInLabel.textAlignment = .center
        signInLabel.textColor = UIColor.white
        return signInLabel
    }()

    let goSignInViewLabel: UILabel = {
        let goSignInViewLabel = UILabel()
        goSignInViewLabel.backgroundColor = UIColor.clear
        goSignInViewLabel.clipsToBounds = true
        goSignInViewLabel.layer.cornerRadius = 10.0
        goSignInViewLabel.layer.borderWidth = 1.0
        goSignInViewLabel.layer.borderColor = UIColor.white.cgColor
        goSignInViewLabel.font = UIFont().mainFont(displaySize: 24)
        goSignInViewLabel.text = "회원가입"
        goSignInViewLabel.textAlignment = .center
        goSignInViewLabel.textColor = UIColor(named: "brownishGray")
        return goSignInViewLabel
    }()

    let goSignInViewButton: UIButton = {
        UIButton()
    }()

    let goSignInButton: UIButton = {
        UIButton()
    }()

    func makePanHeartImageViewConstraint() {
        self.panHeartImageView.translatesAutoresizingMaskIntoConstraints = false
        self.panHeartImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: -20).isActive = true
        NSLayoutConstraint(item: self.panHeartImageView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY,
                           multiplier: 0.4,
                           constant: 0.0).isActive = true
        self.panHeartImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
        self.panHeartImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
    }

    func makePanImageViewConstraint() {
        self.panImageView.translatesAutoresizingMaskIntoConstraints = false
        self.panImageView.leadingAnchor.constraint(equalTo: self.panHeartImageView.trailingAnchor, constant: -5).isActive = true
        NSLayoutConstraint(item: self.panImageView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self.panHeartImageView,
                           attribute: .centerY,
                           multiplier: 0.8,
                           constant: 0.0).isActive = true
        self.panImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
        self.panImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.38).isActive = true
    }

    func makeHomeTitleLabelConstrinat() {
        self.homeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.homeTitleLabel.topAnchor.constraint(equalTo: self.panHeartImageView.bottomAnchor, constant: 5.0).isActive = true
        self.homeTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    func makeTwoButtonStackConstraint() {
        self.twoButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        self.twoButtonStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        NSLayoutConstraint(item: self.twoButtonStackView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY,
                           multiplier: 1.5,
                           constant: 0.0).isActive = true
        self.twoButtonStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        self.twoButtonStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }

    func makeLoginLabelConstraint() {
        self.signInLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.066).isActive = true
    }

    func prepareViews() {
        addSubview(self.panHeartImageView)
        self.makePanHeartImageViewConstraint()

        addSubview(self.panImageView)
        self.makePanImageViewConstraint()

        addSubview(self.homeTitleLabel)
        self.makeHomeTitleLabelConstrinat()

        addSubview(self.twoButtonStackView)
        self.makeTwoButtonStackConstraint()
    }

    func prepareStackView() {
        self.twoButtonStackView.addArrangedSubview(self.signInLabel)
        self.makeLoginLabelConstraint()
        self.twoButtonStackView.addArrangedSubview(self.goSignInViewLabel)

        addSubview(self.goSignInViewButton)
        self.goSignInViewButton.equalLabelWidthHeight(targetLabel: self.signInLabel)

        addSubview(self.goSignInButton)
        self.goSignInButton.equalLabelWidthHeight(targetLabel: self.goSignInViewLabel)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Pale")

        self.prepareViews()
        self.prepareStackView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension UIView {
    func equalLabelWidthHeight(targetLabel: UILabel) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: targetLabel.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: targetLabel.heightAnchor).isActive = true
        self.centerXAnchor.constraint(equalTo: targetLabel.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: targetLabel.centerYAnchor).isActive = true
    }
}
