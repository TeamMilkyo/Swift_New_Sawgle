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
    var previousIndex: Int?

    var tabBarOwnView: CustomTabBarView {
        return self.view as! CustomTabBarView
    }

    @objc func linkAction(_ sender: UIButton) {
        if self.previousIndex != sender.tag {
            if self.previousIndex != nil {
                let prevButton = self.tabBarOwnView.viewWithTag(self.previousIndex!) as? UIButton
                prevButton?.isSelected = false
            }
            sender.isSelected = true
            self.checkView()
            self.previousIndex = sender.tag
            self.moveView(sender.tag - 1)
        }
    }

    /// 새로운 뷰를 만들기 전에 기본의 뷰가 있으면 그 뷰를 제거한다.
    func checkView() {
        guard let previousSelectedIndex = previousIndex else {
            return
        }

        let previousViewArrayNumber = previousSelectedIndex - 1
        self.navigationViewController?.willMove(toParent: nil)
        self.navigationViewController?.view.removeFromSuperview()
        self.navigationViewController?.removeFromParent()

        self.viewControllerList[previousViewArrayNumber].willMove(toParent: nil)
        self.viewControllerList[previousViewArrayNumber].view.removeFromSuperview()
        self.viewControllerList[previousViewArrayNumber].removeFromParent()
    }

    /// 새로운 뷰로 이동한다.
    func moveView(_ index: Int) {
        guard let targetView = view as? CustomTabBarView else {
            return
        }

        guard let titleColor = ColorList.brownishGray else {
            return
        }

        let newNavigationController = UINavigationController(rootViewController: viewControllerList[index])
        newNavigationController.navigationBar.barTintColor = UIColor.white
        newNavigationController.navigationBar.shadowImage = UIImage()
        newNavigationController.navigationBar.titleTextAttributes = [.font: UIFont.mainFont(displaySize: 24), .foregroundColor: titleColor]

        self.navigationViewController = newNavigationController
        newNavigationController.view.frame = targetView.contentView.bounds
        addChild(newNavigationController)
        targetView.contentView.addSubview(newNavigationController.view)

        newNavigationController.didMove(toParent: self)
    }

    @objc func presentWriteView() {
        let writeView = WriteViewController()
        present(writeView, animated: true)
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
    }

    /// 뷰가 로딩이 다 되고 난 뒤 기본 뷰를 셋팅한다.
    override func viewDidAppear(_: Bool) {
        if self.previousIndex == nil {
            if let startButton = tabBarOwnView.viewWithTag(1) as? UIButton {
                self.linkAction(startButton)
            }
        }
    }
}
