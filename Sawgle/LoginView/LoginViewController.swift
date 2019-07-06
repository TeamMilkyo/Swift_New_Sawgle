//
//  LoginViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 24/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    // 현재 뷰를 dismiss한다.
    @objc func dismissViewController() {
        self.dismiss(animated: true)
    }

    /// 백버튼에 액션을 연결한다.
    func linkActionInLoginVC() {
        guard let ownView = view as? LoginView else {
            return
        }

        ownView.backButton.addTarget(self, action: #selector(self.dismissViewController), for: .touchUpInside)
    }

    override func loadView() {
        view = LoginView()
    }

    override func viewDidLoad() {
        self.linkActionInLoginVC()
    }
}
