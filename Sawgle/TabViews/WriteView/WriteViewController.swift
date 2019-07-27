//
//  WriteViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 27/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {
    @objc func cancelView() {
        dismiss(animated: true)
    }

    override func loadView() {
        view = WriteView()
    }
}
