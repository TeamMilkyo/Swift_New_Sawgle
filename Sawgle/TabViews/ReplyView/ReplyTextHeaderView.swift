//
//  ReplyTextHeaderView.swift
//  Sawgle
//
//  Created by Milkyo on 28/07/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

// MARK: - 댓글테이블 뷰 최상단 섹션헤더뷰

class ReplyTextHeaderView: UIView {
    // MARK: - Properties

    lazy var textDateFormatter: DateFormatter = {
        let textDateFormatter = DateFormatter()
        textDateFormatter.dateFormat = "yyyy.MM.dd a h:mm"
        textDateFormatter.locale = Locale(identifier: "ko_KR")
        return textDateFormatter
    }()

    let bottomBorderView: UIView = {
        let bottomBorderView = UIView()
        bottomBorderView.backgroundColor = UIColor.white
        return bottomBorderView
    }()

    let replyTextHeaderTitleLabel: UILabel = {
        let replyTextHeaderTitleLabel = UILabel()
        replyTextHeaderTitleLabel.font = UIFont(name: "S-CoreDream-5Medium", size: 18)
        replyTextHeaderTitleLabel.text = "페이지 제목" // 페이지 제목 내용
        return replyTextHeaderTitleLabel
    }()

    let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 10)

        return dateLabel
    }()

    let heartImageView: UIImageView = {
        let heartImageView = UIImageView()
        heartImageView.image = UIImage(named: "heart")
        heartImageView.contentMode = .scaleAspectFit
        return heartImageView
    }()

    let heartCountLabel: UILabel = {
        let heartCountLabel = UILabel()
        heartCountLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 10)
        return heartCountLabel
    }()

    // MARK: - Setting Methods

    // MARK: setConstraints

    func makeTitleLabelContraint() {
        self.replyTextHeaderTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.replyTextHeaderTitleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            self.replyTextHeaderTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            self.replyTextHeaderTitleLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.76),
        ])
    }

    func makeDateLabelContraint() {
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.dateLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            self.dateLabel.topAnchor.constraint(equalTo: replyTextHeaderTitleLabel.bottomAnchor, constant: 10),
            self.dateLabel.widthAnchor.constraint(equalTo: replyTextHeaderTitleLabel.widthAnchor, multiplier: 0.8),
        ])
    }

    func makeBottomBorderViewContraint() {
        self.bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.bottomBorderView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            self.bottomBorderView.heightAnchor.constraint(equalToConstant: 1.0),
            self.bottomBorderView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            self.bottomBorderView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        ])
    }

    func makeHeartImageViewContraint() {
        self.heartImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heartImageView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10),
            self.heartImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25),
            self.heartImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -10),
        ])
    }

    func makeHeartCountLabelContraint() {
        self.heartCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heartCountLabel.centerXAnchor.constraint(equalTo: self.heartImageView.centerXAnchor),
            self.heartCountLabel.topAnchor.constraint(equalTo: self.heartImageView.bottomAnchor, constant: -15),
            self.heartCountLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5),
        ])
    }

    func makeHeartCountView(count: Int) {
        self.heartCountLabel.text = "\(count)"
        addSubview(self.heartImageView)
        addSubview(self.heartCountLabel)
    }

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeSubView()
        self.makeSubViewConstraint()
        let date = Date()
        dateLabel.text = self.textDateFormatter.string(from: date)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension ReplyTextHeaderView: UIViewItemProtocol {
    func makeSubViewConstraint() {
        self.makeTitleLabelContraint()
        self.makeDateLabelContraint()
        self.makeBottomBorderViewContraint()
        self.makeHeartImageViewContraint()
        self.makeHeartCountLabelContraint()
    }

    func makeSubView() {
        addSubview(self.replyTextHeaderTitleLabel)
        addSubview(self.dateLabel)
        addSubview(self.bottomBorderView)
        self.makeHeartCountView(count: 10)
    }
}
