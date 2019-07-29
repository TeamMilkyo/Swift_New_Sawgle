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

    override func loadView() {
        view = SignInView()
    }
}
