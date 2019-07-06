//
//  CustomTabBarView.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 27/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class CustomTabBarView: UIView {
    var buttonSize: CGFloat = 70
    var buttonBackImageSize: CGFloat = 0

    let contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()

    let customTabBar: UITabBar = {
        let customTabBar = UITabBar()
        customTabBar.layer.borderWidth = 0
        customTabBar.clipsToBounds = true
        customTabBar.barTintColor = UIColor(named: "Pale")
        customTabBar.tintColor = UIColor(named: "Pale")
        return customTabBar
    }()

    let leftStack: TwoButtonStack = {
        TwoButtonStack()
    }()

    let rightStack: TwoButtonStack = {
        TwoButtonStack()
    }()

    let centerButtonBackImage: UIImageView = {
        UIImageView()
    }()

    let centerButton: UIButton = {
        UIButton()
    }()

    let backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = .white
        return backView
    }()

    func makeContentViewConstraint() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: customTabBar.topAnchor, constant: -5),
            contentView.topAnchor.constraint(equalTo: topAnchor),
        ])
    }

    func makeCustomTabBarConstraint() {
        self.customTabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customTabBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -buttonSize),
            customTabBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            customTabBar.centerXAnchor.constraint(equalTo: centerXAnchor),
            customTabBar.widthAnchor.constraint(equalTo: widthAnchor),
        ])
    }

    func makeStackConstraint(targetStack: UIView) {
        targetStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            targetStack.widthAnchor.constraint(equalTo: customTabBar.widthAnchor, multiplier: 0.3),
            targetStack.topAnchor.constraint(equalTo: customTabBar.topAnchor, constant: 0),
        ])
    }

    func makeLeftStackConstraint() {
        self.leftStack.leadingAnchor.constraint(equalTo: self.customTabBar.leadingAnchor, constant: 16).isActive = true
    }

    func makeRightStackConstraint() {
        self.rightStack.trailingAnchor.constraint(equalTo: self.customTabBar.trailingAnchor, constant: -16).isActive = true
    }

    func makeCenterButtonBackImageConstraint() {
        self.centerButtonBackImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerButtonBackImage.centerXAnchor.constraint(equalTo: customTabBar.centerXAnchor),
            centerButtonBackImage.widthAnchor.constraint(equalToConstant: buttonBackImageSize),
            centerButtonBackImage.heightAnchor.constraint(equalTo: centerButtonBackImage.widthAnchor),
            centerButtonBackImage.topAnchor.constraint(equalTo: customTabBar.topAnchor, constant: -(buttonBackImageSize / 2)),

        ])
    }

    func makeCenterButtonConstraint() {
        self.centerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerButton.centerXAnchor.constraint(equalTo: centerButtonBackImage.centerXAnchor),
            centerButton.centerYAnchor.constraint(equalTo: centerButtonBackImage.centerYAnchor),
            centerButton.widthAnchor.constraint(equalToConstant: buttonSize),
            centerButton.heightAnchor.constraint(equalTo: centerButton.widthAnchor),
            centerButton.topAnchor.constraint(equalTo: customTabBar.topAnchor, constant: -(buttonSize / 2)),
        ])
    }

    func makeBackViewConstraint() {
        self.backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backView.centerXAnchor.constraint(equalTo: customTabBar.centerXAnchor),
            backView.centerYAnchor.constraint(equalTo: customTabBar.centerYAnchor),
            backView.widthAnchor.constraint(equalTo: customTabBar.widthAnchor),
            backView.heightAnchor.constraint(equalTo: customTabBar.heightAnchor),
        ])
    }

    func makeView() {
        backgroundColor = UIColor(named: "Pale")
        addSubview(self.contentView)
        addSubview(self.customTabBar)
        addSubview(self.backView)

        self.backView.addSubview(self.leftStack)
        self.backView.addSubview(self.rightStack)
        self.backView.addSubview(self.centerButtonBackImage)
        self.backView.addSubview(self.centerButton)
    }

    func makeItemConstraints() {
        self.makeCustomTabBarConstraint()
        self.makeStackConstraint(targetStack: self.leftStack)
        self.makeLeftStackConstraint()
        self.makeStackConstraint(targetStack: self.rightStack)
        self.makeRightStackConstraint()
        self.makeCenterButtonBackImageConstraint()
        self.makeCenterButtonConstraint()
        self.makeContentViewConstraint()
        self.makeBackViewConstraint()
    }

    func makeCircleBackButtonImage() {
        self.centerButtonBackImage.backgroundColor = UIColor(named: "Pale")
        self.centerButtonBackImage.layer.cornerRadius = self.buttonBackImageSize / 2
    }

    func makeCircleBackButton() {
        self.centerButton.setImage(UIImage(named: "write"), for: .normal)
        self.centerButton.layer.cornerRadius = self.buttonSize / 2
    }

    /// 버튼의 기본적인 상태를 설정한다.
    func insertDefaultOptionAtButton() {
        if let firtButton = leftStack.firstItem as? ButtonStack {
            firtButton.button.setImage(UIImage(named: "Home"), for: .normal)
            firtButton.button.setImage(UIImage(named: "SelectedHome"), for: .selected)
            firtButton.button.setImage(UIImage(named: "SelectedHome"), for: [.selected, .highlighted])
            firtButton.buttonTitle.text = "써글홈"
        }
        if let secondButton = leftStack.secondItem as? ButtonStack {
            secondButton.button.setImage(UIImage(named: "Bookmark"), for: .normal)
            secondButton.button.setImage(UIImage(named: "SelectedBookMark"), for: .selected)
            secondButton.button.setImage(UIImage(named: "SelectedBookMark"), for: [.selected, .highlighted])
            secondButton.buttonTitle.text = "즐겨찾기"
        }
        if let thirdButton = rightStack.firstItem as? ButtonStack {
            thirdButton.button.setImage(UIImage(named: "MyWrite"), for: .normal)
            thirdButton.button.setImage(UIImage(named: "SelectedMyWrite"), for: .selected)
            thirdButton.button.setImage(UIImage(named: "SelectedMyWrite"), for: [.selected, .highlighted])
            thirdButton.buttonTitle.text = "마이글"
        }
        if let fourButton = rightStack.secondItem as? ButtonStack {
            fourButton.button.setImage(UIImage(named: "Setting"), for: .normal)
            fourButton.button.setImage(UIImage(named: "SelectedSetting"), for: .selected)
            fourButton.button.setImage(UIImage(named: "SelectedSetting"), for: [.selected, .highlighted])
            fourButton.buttonTitle.text = "관리"
        }
    }

    func makeBackViewLayer() {
        self.backView.layer.cornerRadius = 30
        self.backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.buttonBackImageSize = self.buttonSize + 10
        self.makeView()
        self.makeItemConstraints()
        self.insertDefaultOptionAtButton()
        self.makeCircleBackButtonImage()
        self.makeCircleBackButton()
        self.makeBackViewLayer()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class TwoButtonStack: UIView {
    let twoButtonStackView: UIStackView = {
        let twoButtonStackView = UIStackView()
        twoButtonStackView.axis = .horizontal
        twoButtonStackView.distribution = .fillEqually
        return twoButtonStackView
    }()

    let firstItem: UIView = {
        ButtonStack()
    }()

    let secondItem: UIView = {
        ButtonStack()
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(self.twoButtonStackView)

        self.twoButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            twoButtonStackView.widthAnchor.constraint(equalTo: widthAnchor),
            twoButtonStackView.heightAnchor.constraint(equalTo: heightAnchor),
            twoButtonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            twoButtonStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])

        self.twoButtonStackView.addArrangedSubview(self.firstItem)

        self.twoButtonStackView.addArrangedSubview(self.secondItem)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class ButtonStack: UIView {
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
        firstButtonLabel.font = UIFont().mainFont(displaySize: 15)
        firstButtonLabel.textColor = #colorLiteral(red: 0.4939999878, green: 0.4199999869, blue: 0.3529999852, alpha: 1)
        firstButtonLabel.contentMode = .center
        firstButtonLabel.textAlignment = .center
        return firstButtonLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(self.buttonStackView)

        self.buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.widthAnchor.constraint(equalTo: widthAnchor),
            buttonStackView.heightAnchor.constraint(equalTo: heightAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.buttonStackView.addArrangedSubview(self.button)
        self.buttonStackView.addArrangedSubview(self.buttonTitle)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
