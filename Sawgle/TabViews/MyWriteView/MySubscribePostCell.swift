//
//  MySubscribePostCell.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 03/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class mySubscribePostCell: UICollectionViewCell {
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont(name: "S-CoreDream-5Medium", size: 13)
        nameLabel.textColor = .white
        return nameLabel
    }()

    let timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.font = UIFont(name: "S-CoreDream-5Medium", size: 13)
        timeLabel.textColor = .white
        return timeLabel
    }()

    let postTextView: UITextView = {
        let postTextView = UITextView()
        postTextView.backgroundColor = .clear
        postTextView.textColor = .white
        postTextView.isScrollEnabled = false
        postTextView.isEditable = false
        postTextView.font = UIFont(name: "S-CoreDream-5Medium", size: 13)
        return postTextView
    }()

    let lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(named: "Pale")
        return lineView
    }()

    let goPostButton: UIButton = {
        let goPostButton = UIButton()
        goPostButton.setTitleColor(UIColor(named: "PaleBrown"), for: .normal)
        goPostButton.setTitle("댓글 본문보기", for: .normal)
        goPostButton.titleLabel?.font = UIFont(name: "S-CoreDream-5Medium", size: 13)
        return goPostButton
    }()

    func makeNameLabelConstraint() {
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.heightAnchor.constraint(equalToConstant: 15),
        ])
    }

    func makeTimeLabelConstraint() {
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            timeLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor),
        ])
    }

    func makePostTextViewConstraint() {
        self.postTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postTextView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            postTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            postTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }

    func makeLineViewConstraint() {
        self.lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.widthAnchor.constraint(equalTo: widthAnchor),
            NSLayoutConstraint(item: lineView,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .centerY,
                               multiplier: 1.5,
                               constant: 0.0),
            lineView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }

    func makeGoPostButtonConstraint() {
        self.goPostButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goPostButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            goPostButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            goPostButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            NSLayoutConstraint(item: goPostButton,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .centerY,
                               multiplier: 1.75,
                               constant: 0.0),
        ])
    }

    func addViewItem() {
        addSubview(self.nameLabel)
        addSubview(self.timeLabel)
        addSubview(self.postTextView)
        addSubview(self.lineView)
        addSubview(self.goPostButton)
    }

    func addVieItemConstraint() {
        self.makeNameLabelConstraint()
        self.makeTimeLabelConstraint()
        self.makePostTextViewConstraint()
        self.makeLineViewConstraint()
        self.postTextView.bottomAnchor.constraint(equalTo: self.lineView.topAnchor, constant: -5).isActive = true
        self.makeGoPostButtonConstraint()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "brownish")
        layer.cornerRadius = 15
        self.addViewItem()
        self.addVieItemConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
