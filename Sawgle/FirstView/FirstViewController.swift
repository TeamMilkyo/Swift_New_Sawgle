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
    @objc func callLoginViewController() {
        let loginVC = LoginViewController()

        self.present(loginVC, animated: true)
    }

    /// 회원가입화면을 생성한다.
    @objc func callSingInViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = storyBoard.instantiateViewController(withIdentifier: "NewRegisterVC")

        self.present(signInVC, animated: true)
    }

    /// 각각 버튼에 액션을 연결한다.
    func linkActionInFirstView() {
        guard let ownView = view as? FirstView else {
            return
        }

        ownView.gologinViewButton.addTarget(self, action: #selector(self.callLoginViewController), for: .touchUpInside)
        ownView.goSingInButton.addTarget(self, action: #selector(self.callSingInViewController), for: .touchUpInside)
    }

    override func loadView() {
        view = FirstView()
    }

    override func viewDidLoad() {
        self.linkActionInFirstView()
    }
}
