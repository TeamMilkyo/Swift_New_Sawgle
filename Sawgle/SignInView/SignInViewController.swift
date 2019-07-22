//
//  SignInViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 24/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    // 현재 뷰를 dismiss한다.
    @objc func dismissViewController() {
        self.dismiss(animated: true)
    }

    /// 백버튼에 액션을 연결한다.
    func linkActionInSignInViewController() {
        guard let ownView = view as? SignInView else {
            return
        }

        ownView.backButton.addTarget(self, action: #selector(self.dismissViewController), for: .touchUpInside)
    }

    override func loadView() {
        view = SignInView()
    }

    override func viewDidLoad() {
        self.linkActionInSignInViewController()
    }
}
