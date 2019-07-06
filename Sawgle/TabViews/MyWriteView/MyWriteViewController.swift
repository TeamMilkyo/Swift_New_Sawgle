//
//  MyWriteHistoryViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 27/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class MyWriteViewController: UIViewController {
    lazy var ownView: MyWriteView = {
        guard let ownView = view as? MyWriteView else {
            return MyWriteView()
        }

        return ownView
    }()

    override func loadView() {
        view = MyWriteView()
    }

    override func viewDidLoad() {
        navigationItem.title = "mygle"

        self.ownView.mySubscribePostView.register(mySubscribePostCell.self, forCellWithReuseIdentifier: "mySubscribePostCell")
        self.ownView.mySubscribePostView.delegate = self
        self.ownView.mySubscribePostView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        let halfViewWidth = self.ownView.bounds.width / 2 - self.ownView.nameImageView.bounds.width

        if self.ownView.nameLabel.bounds.width > halfViewWidth {
            self.ownView.nameLabel.widthAnchor.constraint(equalToConstant: halfViewWidth).isActive = true
            self.ownView.nameLabel.adjustsFontSizeToFitWidth = true
        }
    }

    override func viewDidAppear(_: Bool) {
        self.ownView.myWriteSectionView.countLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: self.ownView.myWriteSectionView.countLabel.bounds.height)
        self.ownView.myCommentSectionView.countLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: self.ownView.myCommentSectionView.countLabel.bounds.height)
        self.ownView.myLikePostSectionView.countLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: self.ownView.myLikePostSectionView.countLabel.bounds.height)
    }
}

/// MARK;- UICollectionViewDelegate
extension MyWriteViewController: UICollectionViewDelegate {
    func collectionView(_: UICollectionView, didSelectItemAt _: IndexPath) {}
}

extension MyWriteViewController: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mySubscribePostCell", for: indexPath) as? mySubscribePostCell else {
            return UICollectionViewCell()
        }

        return cell
    }
}

extension MyWriteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let width = view.bounds.width * 0.43
        let height = collectionView.bounds.height

        return CGSize(width: width, height: height)
    }
}

// MARK: - UIViewController Extension

// MARK: viewController push/pop 화면전환 함수구현

extension UIViewController {
    func presentCustomTransition(_ viewControllerToPresent: UIViewController) {
        guard let windowLayer: CALayer = self.view.window?.layer else { return }
        let customTransition = CATransition()
        customTransition.type = CATransitionType.push
        customTransition.subtype = CATransitionSubtype.fromRight
        windowLayer.add(customTransition, forKey: kCATransition)

        present(viewControllerToPresent, animated: false)
    }

    func dismissCustomTransition() {
        guard let windowLayer: CALayer = self.view.window?.layer else { return }
        let customTransition = CATransition()
        customTransition.type = CATransitionType.push
        customTransition.subtype = CATransitionSubtype.fromLeft
        windowLayer.add(customTransition, forKey: kCATransition)

        dismiss(animated: false)
    }
}
