//
//  CustomTabBar.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 27/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class CustomTabBarController: UIViewController {
    var homeViewController: HomeViewController?
    var boomarkViewController: BookMarkViewController?
    var mywriteViewController: MyWriteViewController?
    var settingViewController: SettingViewController?
    var navigationViewController: UINavigationController?
    var viewControllerList = [UIViewController]()
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
        self.navigationViewController?.willMove(toParent: nil)
        self.navigationViewController?.view.removeFromSuperview()
        self.navigationViewController?.removeFromParent()

        self.viewControllerList[prevViewArrayNumber].willMove(toParent: nil)
        self.viewControllerList[prevViewArrayNumber].view.removeFromSuperview()
        self.viewControllerList[prevViewArrayNumber].removeFromParent()
    }

    /// 새로운 뷰로 이동한다.
    func moveView(_ index: Int) {
        guard let targetView = view as? CustomTabBarView else {
            return
        }

        guard let titleColor = UIColor(named: "brownishGray") else {
            return
        }

        let newNavigation = UINavigationController(rootViewController: viewControllerList[index])
        newNavigation.navigationBar.barTintColor = UIColor.white
        newNavigation.navigationBar.shadowImage = UIImage()
        newNavigation.navigationBar.titleTextAttributes = [.font: UIFont().mainFont(displaySize: 24), .foregroundColor: titleColor]

        self.navigationViewController = newNavigation
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
        guard let views = [homeViewController, boomarkViewController, mywriteViewController, settingViewController] as? [UIViewController] else {
            return
        }

        self.viewControllerList = views
    }

    override func loadView() {
        view = CustomTabBarView()
    }

    override func viewDidLoad() {
        self.homeViewController = HomeViewController()
        self.boomarkViewController = BookMarkViewController()
        self.mywriteViewController = MyWriteViewController()
        self.settingViewController = SettingViewController()

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
