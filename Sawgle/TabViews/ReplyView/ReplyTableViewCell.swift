//
//  ReplyTableViewCell.swift
//  Sawgle
//
//  Created by Min Kyeong Tae on 17/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

// MARK: - 글 제목 및 텍스트 뷰 셀

class ReplyTextTableViewCell: UITableViewCell {
    let replyTextView: UITextView = {
        let replyTextView = UITextView()
        replyTextView.textContainerInset = UIEdgeInsets(top: 0, left: -replyTextView.textContainer.lineFragmentPadding, bottom: 0, right: replyTextView.textContainer.lineFragmentPadding)
        replyTextView.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0)
        replyTextView.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 12)
        replyTextView.textColor = ColorList.greyishBrown
        replyTextView.isEditable = false
        replyTextView.isScrollEnabled = false

        return replyTextView
    }()

    func setReplyTextView(text: String) {
        self.replyTextView.text = text
    }

    func setConstraint() {
        self.replyTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            replyTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            replyTextView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            replyTextView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15.7),
            replyTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -80),
        ])
    }

    func addSubViews() {
        addSubview(self.replyTextView)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubViews()
        self.setReplyTextView(text: " ") // 댓글 내용 셋팅
        self.setConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
