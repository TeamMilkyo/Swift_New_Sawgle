//
//  MyWriteHistoryViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 27/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class MyWriteViewController: UIViewController {
    var mywriteOwnView: MyWriteView {
        return self.view as! MyWriteView
    }

    override func loadView() {
        view = MyWriteView()
    }

    override func viewDidLoad() {
        self.navigationItem.title = "마이글"
        registerCell()
        self.mywriteOwnView.mySubscribePostView.delegate = self
        self.mywriteOwnView.mySubscribePostView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        let halfViewWidth = self.mywriteOwnView.bounds.width / 2 - self.mywriteOwnView.nameImageView.bounds.width

        if self.mywriteOwnView.nameLabel.bounds.width > halfViewWidth {
            self.mywriteOwnView.nameLabel.widthAnchor.constraint(equalToConstant: halfViewWidth).isActive = true
            self.mywriteOwnView.nameLabel.adjustsFontSizeToFitWidth = true
        }
    }

    override func viewDidAppear(_: Bool) {
        let countFont = UIFont(name: "S-CoreDream-3Light", size: self.mywriteOwnView.myWriteSectionView.countLabel.bounds.height)
        let unitFont = UIFont(name: "S-CoreDream-3Light", size: self.mywriteOwnView.myWriteSectionView.countLabel.bounds.height * 0.45)
        self.mywriteOwnView.myWriteSectionView.countLabel.font = countFont
        self.mywriteOwnView.myCommentSectionView.countLabel.font = countFont
        self.mywriteOwnView.myLikePostSectionView.countLabel.font = countFont
        self.mywriteOwnView.myWriteSectionView.unitLabel.font = unitFont
        self.mywriteOwnView.myCommentSectionView.unitLabel.font = unitFont
        self.mywriteOwnView.myLikePostSectionView.unitLabel.font = unitFont
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
        let width = view.bounds.width * 0.4
        let height = collectionView.bounds.height

        return CGSize(width: width, height: height)
    }
}

extension MyWriteViewController: CellProtocol {
    func registerCell() {
        self.mywriteOwnView.mySubscribePostView.register(mySubscribePostCell.self, forCellWithReuseIdentifier: "mySubscribePostCell")
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
