//
//  ReplyPostTableViewCell.swift
//  Sawgle
//
//  Created by Milkyo on 28/07/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

// MARK: - 댓글 테이블뷰 댓글 셀

class ReplyPostTableViewCell: UITableViewCell {
    let heartView: CellHeartView = {
        let heartView = CellHeartView()

        return heartView
    }()

    let postDateLabel: UILabel = {
        let replyPostDateLabel = UILabel()
        replyPostDateLabel.text = "댓글 날짜" // 댓글 타임스탬프
        replyPostDateLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 10)
        return replyPostDateLabel
    }()

    let replyPostNickNameLabel: UILabel = {
        let replyPostNickNameLabel = UILabel()
        replyPostNickNameLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 12)
        replyPostNickNameLabel.text = "닉네임" // 댓글 닉네임
        replyPostNickNameLabel.textColor = UIColor.black
        return replyPostNickNameLabel
    }()

    let replyPostTextLabel: UILabel = {
        let replyPostTextLabel = UILabel()
        replyPostTextLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 11)
        replyPostTextLabel.text = "댓글 텍스트" // 댓글 내용
        return replyPostTextLabel
    }()

    let bottomBorderView: UIView = {
        let bottomBorderView = UIView()
        bottomBorderView.backgroundColor = UIColor.white
        return bottomBorderView
    }()

    // MARK: - Setting Methods

    // MARK: set Constraint

    func makePostDateLabelConstraint() {
        self.postDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postDateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            postDateLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            postDateLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
        ])
    }

    func makeBottomBorderViewConstraint() {
        self.bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomBorderView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            bottomBorderView.heightAnchor.constraint(equalToConstant: 1),
            bottomBorderView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            bottomBorderView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    func makePostNickNameLabelConstraint() {
        self.replyPostNickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            replyPostNickNameLabel.topAnchor.constraint(equalTo: postDateLabel.bottomAnchor, constant: 6),
            replyPostNickNameLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            replyPostNickNameLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.1),
            replyPostNickNameLabel.bottomAnchor.constraint(equalTo: bottomBorderView.bottomAnchor, constant: -9),
        ])
    }

    func makePostTextLabelConstraint() {
        self.replyPostTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            replyPostTextLabel.leftAnchor.constraint(equalTo: replyPostNickNameLabel.rightAnchor, constant: 5),
            replyPostTextLabel.rightAnchor.constraint(equalTo: postDateLabel.rightAnchor),
            replyPostTextLabel.centerYAnchor.constraint(equalTo: replyPostNickNameLabel.centerYAnchor),
            replyPostTextLabel.heightAnchor.constraint(equalTo: replyPostNickNameLabel.heightAnchor),
        ])
    }

    func makeHeartViewContraint() {
        self.heartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15.7),
            heartView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -10),
            heartView.heightAnchor.constraint(equalToConstant: 25),
            heartView.widthAnchor.constraint(equalTo: heartView.heightAnchor, multiplier: 1),
        ])
    }

    /// setting to postTableViewCellData
    ///
    /// - Parameter replyData: 서버 연동 후 재작업 필요
    func makePostTableViewCellData(replyData: ReplyData) {
        self.replyPostTextLabel.text = replyData.postText
        self.replyPostNickNameLabel.text = replyData.nickName
        self.postDateLabel.text = replyData.postDate
        self.heartView.makeHeartCount(count: replyData.heartCount)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeSubView()
        self.makeSubViewConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension ReplyPostTableViewCell: UIViewItemProtocol {
    func makeSubView() {
        addSubview(self.heartView)
        addSubview(self.bottomBorderView)
        addSubview(self.postDateLabel)
        addSubview(self.replyPostNickNameLabel)
        addSubview(self.replyPostTextLabel)
    }

    func makeSubViewConstraint() {
        self.makeBottomBorderViewConstraint()
        self.makePostDateLabelConstraint()
        self.makePostNickNameLabelConstraint()
        self.makePostTextLabelConstraint()
        self.makeHeartViewContraint()
    }
}
