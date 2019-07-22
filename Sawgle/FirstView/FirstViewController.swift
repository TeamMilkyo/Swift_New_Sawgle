//
//  FirstViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 24/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    /// 로그인 화면을 생성한다.
    @objc func callSignInViewController() {
        let signInViewController = SignInViewController()

        self.present(signInViewController, animated: true)
    }

    /// 회원가입화면을 생성한다.
    @objc func callSignUpViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let signUpViewControlller = storyBoard.instantiateViewController(withIdentifier: "NewSignUpViewController")

        self.present(signUpViewControlller, animated: true)
    }

    /// 각각 버튼에 액션을 연결한다.
    func linkActionInFirstView() {
        guard let ownView = view as? FirstView else {
            return
        }

        ownView.goSignInViewButton.addTarget(self, action: #selector(self.callSignInViewController), for: .touchUpInside)
        ownView.goSignUpButton.addTarget(self, action: #selector(self.callSignUpViewController), for: .touchUpInside)
    }

    override func loadView() {
        view = FirstView()
    }

    override func viewDidLoad() {
        self.linkActionInFirstView()
    }
}
