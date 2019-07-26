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

//    let signInLabel: UILabel = {
//        let signInLabel = UILabel()
//        signInLabel.backgroundColor = UIColor(named: "Peach")
//        signInLabel.clipsToBounds = true
//        signInLabel.layer.cornerRadius = 10.0
//        signInLabel.font = UIFont().mainFont(displaySize: 24)
//        signInLabel.text = "로그인"
//        signInLabel.textAlignment = .center
//        signInLabel.textColor = UIColor.white
//        return signInLabel
//    }()
//
//    let goSignUpViewLabel: UILabel = {
//        let goSignInViewLabel = UILabel()
//        goSignInViewLabel.backgroundColor = UIColor.clear
//        goSignInViewLabel.clipsToBounds = true
//        goSignInViewLabel.layer.cornerRadius = 10.0
//        goSignInViewLabel.layer.borderWidth = 1.0
//        goSignInViewLabel.layer.borderColor = UIColor.white.cgColor
//        goSignInViewLabel.font = UIFont().mainFont(displaySize: 24)
//        goSignInViewLabel.text = "회원가입"
//        goSignInViewLabel.textAlignment = .center
//        goSignInViewLabel.textColor = UIColor(named: "brownishGray")
//        return goSignInViewLabel
//    }()

    let goSignInViewButton: UIButton = {
        UIButton()
    }()

    let goSignUpViewButton: UIButton = {
        UIButton()
    }()

    func makeDefaultButton(target: UIButton, title: String, titleColor: UIColor, backgrondColor: UIColor) {
        target.backgroundColor = backgrondColor
        target.clipsToBounds = true
        target.layer.cornerRadius = 10.0
        target.titleLabel?.font = UIFont().mainFont(displaySize: 24)
        target.setTitle(title, for: .normal)
        target.titleLabel?.textAlignment = .center
        target.setTitleColor(titleColor, for: .normal)
    }

    func makeSignInViewButton() {
        guard let backgroundColor = UIColor(named: "Peach") else { return }
        self.makeDefaultButton(target: self.goSignInViewButton, title: "로그인", titleColor: UIColor.white, backgrondColor: backgroundColor)
    }

    func makeSignUpViewButton() {
        guard let titleColor = UIColor(named: "brownishGray") else { return }
        self.makeDefaultButton(target: self.goSignUpViewButton, title: "회원가입", titleColor: titleColor, backgrondColor: UIColor.clear)
        self.goSignUpViewButton.layer.borderWidth = 3.0
        self.goSignUpViewButton.layer.borderColor = UIColor.white.cgColor
    }

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
        self.goSignInViewButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.066).isActive = true
    }

    func makeSubViewConstraint() {
        self.makePanHeartImageViewConstraint()
        self.makePanImageViewConstraint()
        self.makeHomeTitleLabelConstrinat()
        self.makeTwoButtonStackConstraint()
        self.makeSignInLabelConstraint()
    }

    func makeStackView() {
        self.twoButtonStackView.addArrangedSubview(self.goSignInViewButton)
        self.twoButtonStackView.addArrangedSubview(self.goSignUpViewButton)
        self.makeSignInViewButton()
        self.makeSignUpViewButton()
    }

    func makeSubView() {
        addSubview(self.panHeartImageView)
        addSubview(self.panImageView)
        addSubview(self.startTitleLabel)
        addSubview(self.twoButtonStackView)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "Pale")
        self.makeSubView()
        self.makeStackView()
        self.makeSubViewConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// extension UIView {
//    func equalLabelWidthHeight(targetLabel: UIButton) {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.widthAnchor.constraint(equalTo: targetLabel.widthAnchor).isActive = true
//        self.heightAnchor.constraint(equalTo: targetLabel.heightAnchor).isActive = true
//        self.centerXAnchor.constraint(equalTo: targetLabel.centerXAnchor).isActive = true
//        self.centerYAnchor.constraint(equalTo: targetLabel.centerYAnchor).isActive = true
//    }
// }
