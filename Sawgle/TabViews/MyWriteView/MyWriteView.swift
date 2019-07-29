//
//  MyWriteView.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 03/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class MyWriteView: UIView {
    let contentView: UIView = {
        UIView()
    }()

    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.mainFont(displaySize: 25)
        nameLabel.textColor = ColorList.brownishGray
        nameLabel.sizeToFit()
        nameLabel.baselineAdjustment = .alignCenters
        return nameLabel
    }()

    let nameImageView: UIImageView = {
        let nameImageView = UIImageView()
        nameImageView.image = UIImage(named: "logo")
        nameImageView.contentMode = UIView.ContentMode.scaleAspectFit
        return nameImageView
    }()

    let rightStackView: UIStackView = {
        let rightStackView = UIStackView()
        rightStackView.axis = NSLayoutConstraint.Axis.vertical
        rightStackView.distribution = UIStackView.Distribution.fillEqually
        return rightStackView
    }()

    let rightStackTitleLabel: UILabel = {
        let rightStackTitleLabel = UILabel()
        rightStackTitleLabel.font = UIFont(name: "S-CoreDream-3Light", size: 10)
        rightStackTitleLabel.textColor = ColorList.paleBrown
        rightStackTitleLabel.text = "마지막 쓴 글"
        rightStackTitleLabel.textAlignment = .right
        return rightStackTitleLabel
    }()

    let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont(name: "S-CoreDream-3Light", size: 13)
        dateLabel.textColor = ColorList.brownishGray
        dateLabel.textAlignment = .right
        return dateLabel
    }()

    let myWriteSectionView: MyWriteSectionView = {
        let myWriteSectionView = MyWriteSectionView()
        myWriteSectionView.sectionTitleLabel.text = "7일 내 내가 쓴 글"
        return myWriteSectionView
    }()

    let myCommentSectionView: MyWriteSectionView = {
        let myCommentSectionView = MyWriteSectionView()
        myCommentSectionView.sectionTitleLabel.text = "내가 쓴 댓글"
        return myCommentSectionView
    }()

    let myLikePostSectionView: MyWriteSectionView = {
        let myLikePostSectionView = MyWriteSectionView()
        myLikePostSectionView.sectionTitleLabel.text = "좋아요 한 글"
        return myLikePostSectionView
    }()

    let goBoardButton: UIButton = {
        let goBoardButton = UIButton()
        goBoardButton.setTitle("게시판에서 보기", for: .normal)
        goBoardButton.setTitleColor(ColorList.newBrown, for: .normal)
        goBoardButton.titleLabel?.font = UIFont(name: "S-CoreDream-3Light", size: 10)
        return goBoardButton
    }()

    let commentTitleLabel: UILabel = {
        let commentTitleLabel = UILabel()
        commentTitleLabel.font = UIFont(name: "S-CoreDream-3Light", size: 13)
        commentTitleLabel.text = "실시간 댓글"
        return commentTitleLabel
    }()

    let commentTitleLineView: UIView = {
        let commentTitleLineView = UIView()
        commentTitleLineView.backgroundColor = .white
        return commentTitleLineView
    }()

    let mySubscribePostView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10.0
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        let mySubscribePostView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        mySubscribePostView.backgroundColor = ColorList.pale
        mySubscribePostView.showsHorizontalScrollIndicator = false
        return mySubscribePostView
    }()

    func makeNameLabelConstraint() {
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

    func makeNameImageViewConstraint() {
        self.nameImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameImageView.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            nameImageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            nameImageView.heightAnchor.constraint(equalTo: nameLabel.heightAnchor, multiplier: 0.4),
            nameImageView.widthAnchor.constraint(equalTo: nameImageView.heightAnchor),
        ])
    }

    func makeRightStackViewConstraint() {
        self.rightStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            rightStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -32),
            rightStackView.heightAnchor.constraint(equalTo: nameLabel.heightAnchor),
        ])
    }

    func makeMyWriteViewConstraint() {
        self.myWriteSectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myWriteSectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            myWriteSectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            myWriteSectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            myWriteSectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
        ])
    }

    func makeMyCommentViewConstraint() {
        self.myCommentSectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myCommentSectionView.topAnchor.constraint(equalTo: myWriteSectionView.bottomAnchor, constant: 10),
            myCommentSectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            myCommentSectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            myCommentSectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -37),
        ])
    }

    func makeCommentTitleLabelConstraint() {
        self.commentTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            commentTitleLabel.topAnchor.constraint(equalTo: myCommentSectionView.bottomAnchor, constant: 16),
            commentTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
        ])
    }

    func makeCommentTitleLineConstraint() {
        self.commentTitleLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            commentTitleLineView.topAnchor.constraint(equalTo: commentTitleLabel.bottomAnchor, constant: 5),
            commentTitleLineView.heightAnchor.constraint(equalToConstant: 2),
            commentTitleLineView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            commentTitleLineView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }

    func makeMyLikePostViewConstraint() {
        self.myLikePostSectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myLikePostSectionView.topAnchor.constraint(equalTo: myWriteSectionView.bottomAnchor, constant: 10),
            myLikePostSectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            myLikePostSectionView.leadingAnchor.constraint(equalTo: myCommentSectionView.trailingAnchor, constant: 10),
            myLikePostSectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -37),
        ])
    }

    func makeMySubscribePostViewConstraint() {
        self.mySubscribePostView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mySubscribePostView.topAnchor.constraint(equalTo: myLikePostSectionView.bottomAnchor, constant: 50),
            mySubscribePostView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.32),
            mySubscribePostView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mySubscribePostView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }

    func makeGoBoardButtonConstraint() {
        self.goBoardButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goBoardButton.trailingAnchor.constraint(equalTo: myWriteSectionView.trailingAnchor, constant: -16),
            goBoardButton.bottomAnchor.constraint(equalTo: myWriteSectionView.bottomAnchor, constant: -5),
        ])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorList.pale
        self.makeSubView()
        self.makeSubViewConstraint()
        self.makeStackView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension MyWriteView: UIViewItemProtocol {
    func makeSubView() {
        addSubview(self.nameLabel)
        addSubview(self.nameImageView)
        addSubview(self.rightStackView)
        addSubview(self.myWriteSectionView)
        addSubview(self.myCommentSectionView)
        addSubview(self.commentTitleLabel)
        addSubview(self.commentTitleLineView)
        addSubview(self.myLikePostSectionView)
        addSubview(self.mySubscribePostView)
        self.myWriteSectionView.addSubview(self.goBoardButton)
    }

    func makeSubViewConstraint() {
        self.makeNameLabelConstraint()
        self.makeNameImageViewConstraint()
        self.makeRightStackViewConstraint()
        self.makeMyWriteViewConstraint()
        self.makeMyCommentViewConstraint()
        self.makeCommentTitleLabelConstraint()
        self.makeCommentTitleLineConstraint()
        self.makeMyLikePostViewConstraint()
        self.makeMySubscribePostViewConstraint()
        self.makeGoBoardButtonConstraint()
    }
}

extension MyWriteView: StackViewItemProtocol {
    func makeStackView() {
        self.rightStackView.addArrangedSubview(self.rightStackTitleLabel)
        self.rightStackView.addArrangedSubview(self.dateLabel)
    }
}
