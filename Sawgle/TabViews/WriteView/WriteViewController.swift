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

    func linkActionInWriteVC() {
        guard let ownView = view as? WriteView else { return }

        ownView.leftButton.addTarget(self, action: #selector(self.cancelView), for: .touchUpInside)
    }

    override func loadView() {
        view = WriteView()
        self.linkActionInWriteVC()
    }
}
