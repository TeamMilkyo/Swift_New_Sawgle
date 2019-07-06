//
//  HomeViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 27/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.9215686275, blue: 0.8235294118, alpha: 1)
    }

    override func viewDidLoad() {
        navigationItem.title = "sawgle"
    }

    override func viewWillAppear(_: Bool) {
        print("HOME")
    }
}
