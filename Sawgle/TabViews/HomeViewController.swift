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
        view.backgroundColor = ColorList.pale
    }

    override func viewDidLoad() {
        navigationItem.title = "sawgle"
    }
}
