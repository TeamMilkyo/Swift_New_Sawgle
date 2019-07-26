//
//  ViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 02/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class StartView: UIView {
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

    let startTitleLabel: UILabel = {
        let startTitleLabel = UILabel()
        startTitleLabel.font = UIFont().mainFont(displaySize: 80)
        startTitleLabel.text = "Sawgle"
        startTitleLabel.textColor = .white
        return startTitleLabel
    }()

    let twoButtonStackView: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = NSLayoutConstraint.Axis.vertical
        buttonStack.distribution = UIStackView.Distribution.fillEqually
        buttonStack.spacing = 20.0
        return buttonStack
    }()

    let presentSignInViewButton: UIButton = {
        if let backgroundColor = ColorList.peach {
            return UIButton().makeDefaultButton(title: "로그인", titleColor: UIColor.white, backgrondColor: backgroundColor)
        }

        return UIButton().makeDefaultButton(title: "로그인", titleColor: UIColor.white, backgrondColor: UIColor.orange)
    }()

    let presentSignUpViewButton: UIButton = {
        if let titleColor = ColorList.brownishGray {
            let button = UIButton().makeDefaultButton(title: "회원가입", titleColor: titleColor, backgrondColor: UIColor.clear)
            button.layer.borderWidth = 3.0
            button.layer.borderColor = UIColor.white.cgColor
            return button
        }

        return UIButton().makeDefaultButton(title: "회원가입", titleColor: UIColor.brown, backgrondColor: UIColor.clear)
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
        self.startTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.startTitleLabel.topAnchor.constraint(equalTo: self.panHeartImageView.bottomAnchor, constant: 5.0).isActive = true
        self.startTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
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

    func makeSignInLabelConstraint() {
        self.presentSignInViewButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.066).isActive = true
    }

    func makeSubViewConstraint() {
        self.makePanHeartImageViewConstraint()
        self.makePanImageViewConstraint()
        self.makeHomeTitleLabelConstrinat()
        self.makeTwoButtonStackConstraint()
        self.makeSignInLabelConstraint()
    }

    func makeStackView() {
        self.twoButtonStackView.addArrangedSubview(self.presentSignInViewButton)
        self.twoButtonStackView.addArrangedSubview(self.presentSignUpViewButton)
    }

    func makeSubView() {
        addSubview(self.panHeartImageView)
        addSubview(self.panImageView)
        addSubview(self.startTitleLabel)
        addSubview(self.twoButtonStackView)
    }

    func linkActionInStartView() {
        self.presentSignInViewButton.addTarget(StartViewController(), action: #selector(StartViewController.presentSignInViewController), for: .touchUpInside)
        self.presentSignUpViewButton.addTarget(StartViewController(), action: #selector(StartViewController.presentSignUpViewController), for: .touchUpInside)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorList.pale
        self.makeSubView()
        self.makeStackView()
        self.makeSubViewConstraint()
        self.linkActionInStartView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
