//
//  CustomTabBar.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 27/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class CustomTabBarController: UIViewController {
    var homeVC: HomeViewController?
    var boomarkVC: BookMarkViewController?
    var mywriteVC: MyWriteViewController?
    var settingVC: SettingViewController?
    var navigation: UINavigationController?
    var vcList = [UIViewController]()
    var prevIndex: Int?

    lazy var ownView: CustomTabBarView = {
        guard let convertView = view as? CustomTabBarView else {
            return CustomTabBarView()
        }

        return convertView
    }()

    @objc func linkAction(_ sender: UIButton) {
        if self.prevIndex != sender.tag {
            if self.prevIndex != nil {
                let prevButton = self.ownView.viewWithTag(self.prevIndex!) as? UIButton
                prevButton?.isSelected = false
            }
            sender.isSelected = true
            self.checkView()
            self.prevIndex = sender.tag
            self.moveView(sender.tag - 1)
        }
    }

    /// 새로운 뷰를 만들기 전에 기본의 뷰가 있으면 그 뷰를 제거한다.
    func checkView() {
        guard let prevSelectedIndex = prevIndex else {
            return
        }

        let prevViewArrayNumber = prevSelectedIndex - 1
        self.navigation?.willMove(toParent: nil)
        self.navigation?.view.removeFromSuperview()
        self.navigation?.removeFromParent()

        self.vcList[prevViewArrayNumber].willMove(toParent: nil)
        self.vcList[prevViewArrayNumber].view.removeFromSuperview()
        self.vcList[prevViewArrayNumber].removeFromParent()
    }

    /// 새로운 뷰로 이동한다.
    func moveView(_ index: Int) {
        guard let targetView = view as? CustomTabBarView else {
            return
        }

        let newNavigation = UINavigationController(rootViewController: vcList[index])
        newNavigation.navigationBar.barTintColor = UIColor(named: "Pale")
        newNavigation.navigationBar.shadowImage = UIImage()
        newNavigation.navigationBar.titleTextAttributes = [.font: UIFont().mainFont(displaySize: 24), .foregroundColor: UIColor.white]

        self.navigation = newNavigation
        newNavigation.view.frame = targetView.contentView.bounds
        addChild(newNavigation)
        targetView.contentView.addSubview(newNavigation.view)

        newNavigation.didMove(toParent: self)
    }

    @objc func moveWriteView() {
        let writeView = WriteViewController()
        present(writeView, animated: true)
    }

    /// 각 탭바의 아이템들을 액션에 연결한다.
    func linkTargetAction() {
        guard let targetView = view as? CustomTabBarView else {
            return
        }

        if let firtButton = targetView.leftStack.firstItem as? ButtonStack {
            firtButton.button.addTarget(self, action: #selector(self.linkAction), for: .touchUpInside)
            firtButton.button.tag = 1
        }
        if let secondButton = targetView.leftStack.secondItem as? ButtonStack {
            secondButton.button.addTarget(self, action: #selector(self.linkAction), for: .touchUpInside)
            secondButton.button.tag = 2
        }
        if let thirdButton = targetView.rightStack.firstItem as? ButtonStack {
            thirdButton.button.addTarget(self, action: #selector(self.linkAction), for: .touchUpInside)
            thirdButton.button.tag = 3
        }
        if let fourButton = targetView.rightStack.secondItem as? ButtonStack {
            fourButton.button.addTarget(self, action: #selector(self.linkAction), for: .touchUpInside)
            fourButton.button.tag = 4
        }

        targetView.centerButton.addTarget(self, action: #selector(self.moveWriteView), for: .touchUpInside)
    }

    func makeViewList() {
        guard let views = [homeVC, boomarkVC, mywriteVC, settingVC] as? [UIViewController] else {
            return
        }

        self.vcList = views
    }

    override func loadView() {
        view = CustomTabBarView()
    }

    override func viewDidLoad() {
        self.homeVC = HomeViewController()
        self.boomarkVC = BookMarkViewController()
        self.mywriteVC = MyWriteViewController()
        self.settingVC = SettingViewController()

        self.makeViewList()
        self.linkTargetAction()
    }

    /// 뷰가 로딩이 다 되고 난 뒤 기본 뷰를 셋팅한다.
    override func viewDidAppear(_: Bool) {
        if self.prevIndex == nil {
            if let startButton = ownView.viewWithTag(1) as? UIButton {
                self.linkAction(startButton)
            }
        }
    }
}

extension UIView {
    func makeLogoView() -> UIImageView {
        let logo = UIImage(named: "logo")
        let logoImageView = UIImageView(image: logo)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor).isActive = true
        return logoImageView
    }
}
