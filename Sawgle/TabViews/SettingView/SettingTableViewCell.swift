//
//  SettingTableCell.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 14/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    let settingTitleLabel: UILabel = {
        let settingTitleLabel = UILabel()
        settingTitleLabel.font = UIFont.mainFont(displaySize: 15)
        settingTitleLabel.textColor = ColorList.puce
        return settingTitleLabel
    }()

    let customSeparatorLine: UIView = {
        let customSeparatorLine = UIView()
        customSeparatorLine.backgroundColor = .white
        return customSeparatorLine
    }()

    func makeTitleLabelConstraint() {
        self.settingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            settingTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
    }

    func makeCustomSeparatorLineConstraint() {
        self.customSeparatorLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customSeparatorLine.widthAnchor.constraint(equalTo: widthAnchor),
            customSeparatorLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            customSeparatorLine.heightAnchor.constraint(equalToConstant: 2),
            customSeparatorLine.topAnchor.constraint(equalTo: topAnchor),
        ])
    }

    func addAccessoryView() {
        let disclosureIndicator = UIImageView(image: UIImage(named: "DisclosureIndicator"))
        self.accessoryView = disclosureIndicator
        self.tintColor = ColorList.paleBrown
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = ColorList.lightPeach
        self.makeSubView()
        self.makeSubViewConstraint()
        self.addAccessoryView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension SettingTableViewCell: UIViewItemProtocol {
    func makeSubView() {
        addSubview(self.settingTitleLabel)
        addSubview(self.customSeparatorLine)
    }

    func makeSubViewConstraint() {
        self.makeTitleLabelConstraint()
        self.makeCustomSeparatorLineConstraint()
    }
}
