//
//  ReplyPostHeaderView.swift
//  Sawgle
//
//  Created by Milkyo on 28/07/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

// MARK: - 댓글섹션 헤더 뷰

class ReplyPostHeaderView: UIView {
    // MARK: headerView UI

    let postHeaderTitleLabel: UILabel = {
        let postHeaderTitleLabel = UILabel()
        postHeaderTitleLabel.text = "댓글"
        postHeaderTitleLabel.font = UIFont(name: "S-CoreDream-5Medium", size: 18)
        return postHeaderTitleLabel
    }()

    let postHeaderTextField: UITextField = {
        let postHeaderTextField = UITextField()
        postHeaderTextField.placeholder = " Saw that Gle"
        postHeaderTextField.backgroundColor = UIColor.white
        postHeaderTextField.autocorrectionType = .no
        postHeaderTextField.textContentType = .nickname
        postHeaderTextField.spellCheckingType = .no
        return postHeaderTextField
    }()

    let postHeaderButton: UIButton = {
        let postHeaderButton = UIButton()
        postHeaderButton.setTitle("써댓글", for: .normal)
        postHeaderButton.titleLabel?.allowsDefaultTighteningForTruncation = false
        postHeaderButton.titleLabel?.adjustsFontSizeToFitWidth = true
        postHeaderButton.titleLabel?.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 10)
        postHeaderButton.titleLabel?.tintColor = UIColor.black
        postHeaderButton.backgroundColor = ColorList.lightGreyGreen
        return postHeaderButton
    }()

    let postHeaderBottomBorderView: UIView = {
        let bottomBorderView = UIView()
        bottomBorderView.backgroundColor = UIColor.white
        return bottomBorderView
    }()

    // MARK: - Setting Methods

    // MARK: set Constraint

    func makeHeaderTitleLabelConstraint() {
        self.postHeaderTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postHeaderTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            postHeaderTitleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            postHeaderTitleLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15.7),
        ])
    }

    func makePostHeaderTextFieldConstraint() {
        self.postHeaderTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postHeaderTextField.leftAnchor.constraint(equalTo: postHeaderTitleLabel.leftAnchor),
            postHeaderTextField.topAnchor.constraint(equalTo: postHeaderTitleLabel.bottomAnchor, constant: 10),
            postHeaderTextField.widthAnchor.constraint(equalTo: postHeaderTitleLabel.widthAnchor, multiplier: 0.85),
            postHeaderTextField.heightAnchor.constraint(equalTo: postHeaderTitleLabel.heightAnchor, multiplier: 1.3),
        ])
    }

    func makePostHeaderButtonConstraint() {
        self.postHeaderButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postHeaderButton.leftAnchor.constraint(equalTo: postHeaderTextField.rightAnchor),
            postHeaderButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15.7),
            postHeaderButton.centerYAnchor.constraint(equalTo: postHeaderTextField.centerYAnchor),
            postHeaderButton.heightAnchor.constraint(equalTo: postHeaderTextField.heightAnchor),
        ])
    }

    func makeBottomBorderViewConstraint() {
        self.postHeaderBottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postHeaderBottomBorderView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            postHeaderBottomBorderView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            postHeaderBottomBorderView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            postHeaderBottomBorderView.heightAnchor.constraint(equalToConstant: 1.0),
        ])
    }

    func makeTitleLabelCount(count: Int) {
        if count == 0 { self.postHeaderTitleLabel.text = "댓글 없음" }
        else { self.postHeaderTitleLabel.text = "\(count)" }
    }

    func makePostReplyCount(count: Int) {
        let titleLabelText: String?
        if count == 0 { titleLabelText = "댓글 없음" }
        else { titleLabelText = "댓글 \(count)" }
        self.postHeaderTitleLabel.text = titleLabelText
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeSubView()
        self.makeSubViewConstraint()
        self.makePostReplyCount(count: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension ReplyPostHeaderView: UIViewItemProtocol {
    func makeSubView() {
        self.addSubview(self.postHeaderTitleLabel)
        self.addSubview(self.postHeaderTextField)
        self.addSubview(self.postHeaderButton)
        self.addSubview(self.postHeaderBottomBorderView)
    }

    func makeSubViewConstraint() {
        self.makeHeaderTitleLabelConstraint()
        self.makePostHeaderTextFieldConstraint()
        self.makePostHeaderButtonConstraint()
        self.makeBottomBorderViewConstraint()
    }
}
