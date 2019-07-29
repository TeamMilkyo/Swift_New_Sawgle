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
        UIView()
    }()

    let customTabBar: UITabBar = {
        let customTabBar = UITabBar()
        customTabBar.layer.borderWidth = 0
        customTabBar.clipsToBounds = true
        customTabBar.barTintColor = ColorList.pale
        customTabBar.tintColor = ColorList.pale
        return customTabBar
    }()

    let leftStackView: TwoButtonStackView = {
        TwoButtonStackView()
    }()

    let rightStackView: TwoButtonStackView = {
        TwoButtonStackView()
    }()

    let centerButtonBackImage: UIImageView = {
        UIImageView()
    }()

    let centerButton: UIButton = {
        UIButton()
    }()

    let customTabBarHideView: UIView = {
        let customTabBarHideView = UIView()
        customTabBarHideView.backgroundColor = .white
        return customTabBarHideView
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

    func makeLeftStackViewConstraint() {
        self.leftStackView.leadingAnchor.constraint(equalTo: self.customTabBar.leadingAnchor, constant: 16).isActive = true
    }

    func makeRightStackViewConstraint() {
        self.rightStackView.trailingAnchor.constraint(equalTo: self.customTabBar.trailingAnchor, constant: -16).isActive = true
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

    func makeCustomTabBarHideViewConstraint() {
        self.customTabBarHideView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customTabBarHideView.centerXAnchor.constraint(equalTo: customTabBar.centerXAnchor),
            customTabBarHideView.centerYAnchor.constraint(equalTo: customTabBar.centerYAnchor),
            customTabBarHideView.widthAnchor.constraint(equalTo: customTabBar.widthAnchor),
            customTabBarHideView.heightAnchor.constraint(equalTo: customTabBar.heightAnchor),
        ])
    }

    func makeCircleBackButtonImage() {
        self.centerButtonBackImage.backgroundColor = ColorList.pale
        self.centerButtonBackImage.layer.cornerRadius = self.buttonBackImageSize / 2
    }

    func makeCircleBackButton() {
        self.centerButton.setImage(UIImage(named: "write"), for: .normal)
        self.centerButton.layer.cornerRadius = self.buttonSize / 2
    }

    /// 버튼의 기본적인 상태를 설정한다.
    func makeDefaultButton() {
        if let firtButton = leftStackView.leftItemView as? ButtonLabelStackView {
            firtButton.button.setImage(UIImage(named: "Home"), for: .normal)
            firtButton.button.setImage(UIImage(named: "SelectedHome"), for: .selected)
            firtButton.button.setImage(UIImage(named: "SelectedHome"), for: [.selected, .highlighted])
            firtButton.buttonTitleLabel.text = "써글홈"
        }
        if let secondButton = leftStackView.rightItemView as? ButtonLabelStackView {
            secondButton.button.setImage(UIImage(named: "Bookmark"), for: .normal)
            secondButton.button.setImage(UIImage(named: "SelectedBookMark"), for: .selected)
            secondButton.button.setImage(UIImage(named: "SelectedBookMark"), for: [.selected, .highlighted])
            secondButton.buttonTitleLabel.text = "즐겨찾기"
        }
        if let thirdButton = rightStackView.leftItemView as? ButtonLabelStackView {
            thirdButton.button.setImage(UIImage(named: "MyWrite"), for: .normal)
            thirdButton.button.setImage(UIImage(named: "SelectedMyWrite"), for: .selected)
            thirdButton.button.setImage(UIImage(named: "SelectedMyWrite"), for: [.selected, .highlighted])
            thirdButton.buttonTitleLabel.text = "마이글"
        }
        if let fourButton = rightStackView.rightItemView as? ButtonLabelStackView {
            fourButton.button.setImage(UIImage(named: "Setting"), for: .normal)
            fourButton.button.setImage(UIImage(named: "SelectedSetting"), for: .selected)
            fourButton.button.setImage(UIImage(named: "SelectedSetting"), for: [.selected, .highlighted])
            fourButton.buttonTitleLabel.text = "관리"
        }
    }

    func makeCustomTabBarHideViewLayer() {
        self.customTabBarHideView.layer.cornerRadius = 30
        self.customTabBarHideView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.buttonBackImageSize = self.buttonSize + 10
        self.makeSubView()
        self.makeSubViewConstraint()
        self.makeDefaultButton()
        self.makeCircleBackButtonImage()
        self.makeCircleBackButton()
        self.makeCustomTabBarHideViewLayer()
        self.linkAction()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension CustomTabBarView: UIViewItemProtocol {
    func makeSubView() {
        backgroundColor = ColorList.pale
        addSubview(self.contentView)
        addSubview(self.customTabBar)
        addSubview(self.customTabBarHideView)

        self.customTabBarHideView.addSubview(self.leftStackView)
        self.customTabBarHideView.addSubview(self.rightStackView)
        self.customTabBarHideView.addSubview(self.centerButtonBackImage)
        self.customTabBarHideView.addSubview(self.centerButton)
    }

    func makeSubViewConstraint() {
        self.makeCustomTabBarConstraint()
        self.makeStackConstraint(targetStack: self.leftStackView)
        self.makeLeftStackViewConstraint()
        self.makeStackConstraint(targetStack: self.rightStackView)
        self.makeRightStackViewConstraint()
        self.makeCenterButtonBackImageConstraint()
        self.makeCenterButtonConstraint()
        self.makeContentViewConstraint()
        self.makeCustomTabBarHideViewConstraint()
    }
}

extension CustomTabBarView: ActionProtocol {
    func linkAction() {
        if let firstStackView = leftStackView.leftItemView as? ButtonLabelStackView {
            firstStackView.button.addTarget(CustomTabBarController(), action: #selector(CustomTabBarController.linkAction), for: .touchUpInside)
            firstStackView.button.tag = 1
        }
        if let secondStackView = leftStackView.rightItemView as? ButtonLabelStackView {
            secondStackView.button.addTarget(CustomTabBarController(), action: #selector(CustomTabBarController.linkAction), for: .touchUpInside)
            secondStackView.button.tag = 2
        }
        if let thirdStackView = rightStackView.leftItemView as? ButtonLabelStackView {
            thirdStackView.button.addTarget(CustomTabBarController(), action: #selector(CustomTabBarController.linkAction), for: .touchUpInside)
            thirdStackView.button.tag = 3
        }
        if let fourthStackView = rightStackView.rightItemView as? ButtonLabelStackView {
            fourthStackView.button.addTarget(CustomTabBarController(), action: #selector(CustomTabBarController.linkAction), for: .touchUpInside)
            fourthStackView.button.tag = 4
        }

        self.centerButton.addTarget(CustomTabBarController(), action: #selector(CustomTabBarController.presentWriteView), for: .touchUpInside)
    }
}
