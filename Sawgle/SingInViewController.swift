//
//  SingInViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 02/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class SingInViewController: UIViewController {
    let singInLogoImageView: UIImageView = {
        let singInLogoImageView = UIImageView()
        singInLogoImageView.image = UIImage(named: "logo")
        return singInLogoImageView
    }()

    let signInTitleLabel: UILabel = {
        if let titleColor = UIColor(named: "brownishGray") {
            return UILabel().makeTitleLabel(titleText: "회원가입", titleSize: 35, titleColor: titleColor)
        }

        return UILabel()
    }()

    func makeSingInLogoConstraint() {
        self.singInLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.singInLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 5).isActive = true
        self.singInLogoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        self.singInLogoImageView.widthAnchor.constraint(equalTo: self.singInLogoImageView.heightAnchor, multiplier: 1.15).isActive = true
        self.singInLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
    }

    func makeSingInTitleConstraint() {
        self.signInTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.signInTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.signInTitleLabel.topAnchor.constraint(equalTo: self.singInLogoImageView.bottomAnchor, constant: 10).isActive = true
    }

    func prepareSignInView() {
        view.addSubview(self.singInLogoImageView)
        self.makeSingInLogoConstraint()
        view.addSubview(self.signInTitleLabel)
        self.makeSingInTitleConstraint()
    }

    @objc func callParentViewController() {
        self.dismiss(animated: true)
    }

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(named: "Pale")
        self.prepareSignInView()
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.callParentViewController))
        swipeGesture.direction = .down
        self.view.addGestureRecognizer(swipeGesture)
    }
}
