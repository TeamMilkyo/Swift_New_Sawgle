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
        postHeaderTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
        postHeaderButton.titleLabel?.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        postHeaderButton.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        return postHeaderButton
    }()

    let postHeaderBottomBorderView: UIView = {
        let bottomBorderView = UIView()
        bottomBorderView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return bottomBorderView
    }()

    // MARK: - Setting Methods

    func addSubview() {
        self.addSubview(self.postHeaderTitleLabel)
        self.addSubview(self.postHeaderTextField)
        self.addSubview(self.postHeaderButton)
        self.addSubview(self.postHeaderBottomBorderView)
    }

    // MARK: set Constraint

    func setConstraint() {
        self.postHeaderTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postHeaderTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            postHeaderTitleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            postHeaderTitleLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15.7),
        ])

        self.postHeaderTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postHeaderTextField.leftAnchor.constraint(equalTo: postHeaderTitleLabel.leftAnchor),
            postHeaderTextField.topAnchor.constraint(equalTo: postHeaderTitleLabel.bottomAnchor, constant: 10),
            postHeaderTextField.widthAnchor.constraint(equalTo: postHeaderTitleLabel.widthAnchor, multiplier: 0.85),
            postHeaderTextField.heightAnchor.constraint(equalTo: postHeaderTitleLabel.heightAnchor, multiplier: 1.3),
        ])

        self.postHeaderButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postHeaderButton.leftAnchor.constraint(equalTo: postHeaderTextField.rightAnchor),
            postHeaderButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15.7),
            postHeaderButton.centerYAnchor.constraint(equalTo: postHeaderTextField.centerYAnchor),
            postHeaderButton.heightAnchor.constraint(equalTo: postHeaderTextField.heightAnchor),
        ])

        self.postHeaderBottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postHeaderBottomBorderView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            postHeaderBottomBorderView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            postHeaderBottomBorderView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            postHeaderBottomBorderView.heightAnchor.constraint(equalToConstant: 1.0),
        ])
    }

    func setTitleLabelCount(count: Int) {
        if count == 0 { self.postHeaderTitleLabel.text = "댓글 없음" }
        else { self.postHeaderTitleLabel.text = "\(count)" }
    }

    func setPostReplyCount(count: Int) {
        let titleLabelText: String?
        if count == 0 { titleLabelText = "댓글 없음" }
        else { titleLabelText = "댓글 \(count)" }
        self.postHeaderTitleLabel.text = titleLabelText
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview()
        self.setConstraint()
        self.setPostReplyCount(count: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
