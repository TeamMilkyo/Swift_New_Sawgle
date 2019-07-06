//
//  ReplyView.swift
//  Sawgle
//
//  Created by Min Kyeong Tae on 17/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

// MARK: - 댓글 메인뷰

class ReplyView: UIView {
    // MARK: Setting Views

    let replyTableView: UITableView = {
        let replyTableView = UITableView(frame: CGRect.zero, style: .grouped)
        replyTableView.backgroundColor = UIColor(named: "PinkishGrey")
        replyTableView.separatorStyle = .none
        replyTableView.allowsSelection = false
        return replyTableView
    }()

    // MARK: - Setting Methods

    // MARK: setViewConstraints

    func setReplyTableViewConstratins() {
        self.replyTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            replyTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            replyTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            replyTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            replyTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
        ])
    }

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.replyTableView)
        self.setReplyTableViewConstratins()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
