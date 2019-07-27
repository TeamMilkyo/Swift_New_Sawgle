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
        let heartView = CellHeartView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        return heartView
    }()

    let replyPostDateLabel: UILabel = {
        let replyPostDateLabel = UILabel()
        replyPostDateLabel.text = " " // 댓글 타임스탬프
        replyPostDateLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 10)
        return replyPostDateLabel
    }()

    let replyPostNickNameLabel: UILabel = {
        let replyPostNickNameLabel = UILabel()
        replyPostNickNameLabel.font = UIFont(name: "S-CoreDream-5Medium", size: 12)
        replyPostNickNameLabel.text = " " // 댓글 닉네임
        return replyPostNickNameLabel
    }()

    let replyPostTextLabel: UILabel = {
        let replyPostTextLabel = UILabel()
        replyPostTextLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 11)
        replyPostTextLabel.text = " " // 댓글 내용
        return replyPostTextLabel
    }()

    let bottomBorderView: UIView = {
        let bottomBorderView = UIView()
        bottomBorderView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return bottomBorderView
    }()

    // MARK: - Setting Methods

    // MARK: set Constraint

    func setConstraint() {
        self.replyPostDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            replyPostDateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            replyPostDateLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            replyPostDateLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
        ])

        self.bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomBorderView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            bottomBorderView.heightAnchor.constraint(equalToConstant: 1),
            bottomBorderView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            bottomBorderView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])

        self.replyPostNickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            replyPostNickNameLabel.topAnchor.constraint(equalTo: replyPostDateLabel.bottomAnchor, constant: 6),
            replyPostNickNameLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            replyPostNickNameLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.1),
            replyPostNickNameLabel.bottomAnchor.constraint(equalTo: bottomBorderView.bottomAnchor, constant: -9),
        ])

        self.replyPostTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            replyPostTextLabel.leftAnchor.constraint(equalTo: replyPostNickNameLabel.rightAnchor, constant: 5),
            replyPostTextLabel.rightAnchor.constraint(equalTo: replyPostDateLabel.rightAnchor),
            replyPostTextLabel.centerYAnchor.constraint(equalTo: replyPostNickNameLabel.centerYAnchor),
            replyPostTextLabel.heightAnchor.constraint(equalTo: replyPostNickNameLabel.heightAnchor),
        ])

        self.heartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            heartView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15.7),
            heartView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            heartView.leftAnchor.constraint(equalTo: replyPostDateLabel.rightAnchor),
        ])

        self.heartView.heartImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartView.heartImageView.topAnchor.constraint(equalTo: heartView.topAnchor, constant: 0),
            heartView.heartImageView.centerXAnchor.constraint(equalTo: heartView.centerXAnchor),
            heartView.heartImageView.heightAnchor.constraint(equalToConstant: 15),
        ])

        self.heartView.heartCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartView.heartCountLabel.centerXAnchor.constraint(equalTo: heartView.heartImageView.centerXAnchor),
            heartView.heartCountLabel.topAnchor.constraint(equalTo: heartView.heartImageView.bottomAnchor, constant: 3),
            heartView.heartCountLabel.bottomAnchor.constraint(equalTo: heartView.bottomAnchor, constant: 0),

        ])
    }

    /// setting to postTableViewCellData
    ///
    /// - Parameter replyData: 서버 연동 후 재작업 필요
    func setPostTableViewCellData(replyData: ReplyData) {
        self.replyPostTextLabel.text = replyData.postText
        self.replyPostNickNameLabel.text = replyData.nickName
        self.replyPostDateLabel.text = replyData.postDate
        self.heartView.setHeartCount(count: replyData.heartCount)
    }

    func addSubviews() {
        addSubview(self.replyPostDateLabel)
        addSubview(self.replyPostNickNameLabel)
        addSubview(self.replyPostTextLabel)
        addSubview(self.bottomBorderView)
        addSubview(self.heartView)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubviews()
        self.setConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
