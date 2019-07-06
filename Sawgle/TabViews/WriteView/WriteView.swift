//
//  WriteViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 27/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class WriteView: UIView {
    var menuViewHeight: CGFloat = 44.0

    lazy var statusBarHeight: CGFloat = {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return CGFloat()
        }

        let height = keyWindow.safeAreaInsets.top

        return height
    }()

    let menuView: UIView = {
        let menuView = UIView()
        menuView.backgroundColor = UIColor(named: "Pale")
        return menuView
    }()

    let bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = .white
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 30
        bottomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return bottomView
    }()

    let leftButton: UIButton = {
        let leftButton = UIButton().makeSideButton(title: "취소")
        leftButton.setTitleColor(UIColor(named: "brownishGray"), for: .normal)
        return leftButton
    }()

    let rightButton: UIButton = {
        let rightButton = UIButton().makeSideButton(title: "써글")
        rightButton.setTitleColor(UIColor(named: "brownishGray"), for: .normal)
        return rightButton
    }()

    let logoImageView: UIImageView = {
        UIView().makeLogoView()
    }()

    func makeMenuViewConstraint() {
        self.menuView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: topAnchor),
            menuView.widthAnchor.constraint(equalTo: widthAnchor),
            menuView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: menuViewHeight),
            menuView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }

    func makeButtonConstarint(targetButton: UIButton) {
        targetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            targetButton.centerYAnchor.constraint(equalTo: menuView.centerYAnchor, constant: statusBarHeight * 0.38),
        ])
    }

    func makeLogoViewConstraint() {
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: menuView.centerYAnchor, constant: statusBarHeight * 0.36),
        ])
    }

    func makeBottomViewConstraint() {
        self.bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: menuView.bottomAnchor),
            bottomView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

        ])
    }

    func addViewItemInWriteView() {
        addSubview(self.menuView)
        addSubview(self.leftButton)
        addSubview(self.logoImageView)
        addSubview(self.rightButton)
        addSubview(self.bottomView)
    }

    func makeViewItemConstraint() {
        self.makeMenuViewConstraint()
        self.makeLogoViewConstraint()
        self.makeButtonConstarint(targetButton: self.leftButton)
        self.makeButtonConstarint(targetButton: self.rightButton)

        self.leftButton.leadingAnchor.constraint(equalTo: self.menuView.leadingAnchor, constant: 32).isActive = true
        self.rightButton.trailingAnchor.constraint(equalTo: self.menuView.trailingAnchor, constant: -32).isActive = true

        self.makeBottomViewConstraint()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.9215686275, blue: 0.8235294118, alpha: 1)

        self.addViewItemInWriteView()
        self.makeViewItemConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension UIButton {
    func makeSideButton(title: String) -> UIButton {
        let leftButton = UIButton()
        leftButton.setTitle(title, for: .normal)
        leftButton.titleLabel?.font = UIFont(name: "S-CoreDream-4Regular", size: 17)
        return leftButton
    }
}
