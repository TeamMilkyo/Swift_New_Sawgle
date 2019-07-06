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
        replyTextView.textColor = UIColor(named: "greyishBrown")
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
        bottomBorderView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return bottomBorderView
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "S-CoreDream-5Medium", size: 18)
        titleLabel.text = " " // 페이지 제목 내용
        return titleLabel
    }()

    let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 10)

        return dateLabel
    }()

    let heartImageView: UIImageView = {
        let heartImageView = UIImageView(image: #imageLiteral(resourceName: "heart"))
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

    func setConstraints() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            self.titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            self.titleLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.76),
        ])

        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.dateLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15.7),
            self.dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            self.dateLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor, multiplier: 0.8),
        ])

        self.bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.bottomBorderView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            self.bottomBorderView.heightAnchor.constraint(equalToConstant: 1.0),
            self.bottomBorderView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            self.bottomBorderView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        ])

        self.heartImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heartImageView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10),
            self.heartImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25),
            self.heartImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: -10),
        ])

        self.heartCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heartCountLabel.centerXAnchor.constraint(equalTo: self.heartImageView.centerXAnchor),
            self.heartCountLabel.topAnchor.constraint(equalTo: self.heartImageView.bottomAnchor, constant: -15),
            self.heartCountLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5),
        ])
    }

    func setSubViews() {
        addSubview(self.titleLabel)
        addSubview(self.dateLabel)
        addSubview(self.bottomBorderView)
        self.setHeartCountView(count: 10)
    }

    func setHeartCountView(count: Int) {
        self.heartCountLabel.text = "\(count)"
        addSubview(self.heartImageView)
        addSubview(self.heartCountLabel)
    }

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setSubViews()
        self.setConstraints()
        let date = Date()
        dateLabel.text = self.textDateFormatter.string(from: date)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - 댓글 테이블뷰 댓글셀 내 하트뷰

class CellHeartView: UIView {
    // MARK: properties

    private var heartCount = 0
    private var isHeartCounting = false

    let heartImageView: UIImageView = {
        let heartImageView = UIImageView(image: #imageLiteral(resourceName: "heart"))
        heartImageView.contentMode = .scaleAspectFit
        return heartImageView
    }()

    let heartCountLabel: UILabel = {
        let heartCountLabel = UILabel()
        heartCountLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 10)
        heartCountLabel.text = "0"
        heartCountLabel.adjustsFontSizeToFitWidth = true
        heartCountLabel.contentMode = .scaleAspectFit
        return heartCountLabel
    }()

    // MARK: - Setting Methods

    func initHearCount() {
        self.heartCount = 0
        self.heartCountLabel.text = "\(self.heartCount)"
    }

    func setHeartCount(count: Int) {
        self.heartCountLabel.text = "\(count)"
    }

    func changeHeartCount() {
        if self.isHeartCounting == false {
            self.heartCount += 1
            self.heartCountLabel.text = "\(self.heartCount)"
            self.isHeartCounting = true
        } else {
            self.heartCount -= 1
            self.heartCountLabel.text = "\(self.heartCount)"
            self.isHeartCounting = false
        }
    }

    func addCellHeartViewSubviews() {
        addSubview(self.heartImageView)
        addSubview(self.heartCountLabel)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initHearCount()
        self.addCellHeartViewSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

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
