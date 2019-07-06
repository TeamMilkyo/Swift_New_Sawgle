//
//  BirthDayVIewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 20/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class BirthDayVIewController: UIViewController {
    @IBAction func moveParentVC(_: Any) {
        self.dismiss(animated: true)
    }

    override func viewDidLoad() {
        view.backgroundColor = .clear

        if let backView = view.viewWithTag(999) {
            backView.layer.cornerRadius = 45.0
        }

        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = view.bounds
        view.insertSubview(blurredEffectView, at: 0)
    }
}
