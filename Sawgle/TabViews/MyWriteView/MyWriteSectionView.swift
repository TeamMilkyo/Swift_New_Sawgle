//
//  WriteViewSectionView.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 03/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class MyWriteSectionView: UIView {
    let sectionTitleLabel: UILabel = {
        let sectionTitleLabel = UILabel()
        sectionTitleLabel.textColor = UIColor(named: "PaleBrown")
        sectionTitleLabel.font = UIFont(name: "S-CoreDream-5Regular", size: 15)
        sectionTitleLabel.baselineAdjustment = .alignCenters
        return sectionTitleLabel
    }()

    let countLabel: UILabel = {
        let countLabel = UILabel()
        countLabel.textColor = UIColor(named: "PinkishGrey")
        return countLabel
    }()

    let enterImageView: UIImageView = {
        let enterImageView = UIImageView()
        enterImageView.image = UIImage(named: "Entrance")
        return enterImageView
    }()

    func makeSectionTitleLabelConstraint() {
        self.sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            sectionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            sectionTitleLabel.heightAnchor.constraint(equalToConstant: 15),
        ])
    }

    func makeCountLabelConstraint() {
        self.countLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countLabel.topAnchor.constraint(equalTo: sectionTitleLabel.bottomAnchor, constant: 16),
            countLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

        ])
    }

    func makeEnterImageViewConstraint() {
        self.enterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterImageView.centerYAnchor.constraint(equalTo: sectionTitleLabel.centerYAnchor),
            enterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            enterImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.22),
        ])
    }

    func addViewItemInMyWriteSectionView() {
        addSubview(self.sectionTitleLabel)
        addSubview(self.countLabel)
        addSubview(self.enterImageView)
    }

    func addViewItemConstraintInMyWriteSectionView() {
        self.makeSectionTitleLabelConstraint()
        self.makeCountLabelConstraint()
        self.makeEnterImageViewConstraint()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 15
        self.addViewItemInMyWriteSectionView()
        self.addViewItemConstraintInMyWriteSectionView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
