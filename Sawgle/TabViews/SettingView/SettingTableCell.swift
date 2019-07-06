//
//  SettingTableCell.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 14/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class SettingTableCell: UITableViewCell {
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont().mainFont(displaySize: 15)
        titleLabel.textColor = UIColor(named: "Puce")
        return titleLabel
    }()

    let customSeparatorLine: UIView = {
        let customSeparatorLine = UIView()
        customSeparatorLine.backgroundColor = .white
        return customSeparatorLine
    }()

    func addTitleLabelConstraint() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
    }

    func addCustomSeparatorLineConstraint() {
        self.customSeparatorLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customSeparatorLine.widthAnchor.constraint(equalTo: widthAnchor),
            customSeparatorLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            customSeparatorLine.heightAnchor.constraint(equalToConstant: 2),
            customSeparatorLine.topAnchor.constraint(equalTo: topAnchor),
        ])
    }

    func addViewItemInSettingView() {
        addSubview(self.titleLabel)
        addSubview(self.customSeparatorLine)
    }

    func addViewItemConstraint() {
        self.addTitleLabelConstraint()
        self.addCustomSeparatorLineConstraint()
    }

    func addAccessoryView() {
        let disclosureIndicator = UIImageView(image: UIImage(named: "DisclosureIndicator"))
        self.accessoryView = disclosureIndicator
        self.tintColor = UIColor(named: "PaleBrown")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = UIColor(named: "lightPale")

        self.addViewItemInSettingView()
        self.addViewItemConstraint()
        self.addAccessoryView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class SettingTableCellWithSwitch: SettingTableCell {
    let toggleSwitch: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.onTintColor = UIColor(named: "lightGreyGreen")
        toggleSwitch.layer.backgroundColor = UIColor(named: "beige")?.cgColor
        return toggleSwitch
    }()

    func addToggleSwitchConstraint() {
        self.toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toggleSwitch.centerYAnchor.constraint(equalTo: centerYAnchor),
            toggleSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryView = .none
        self.selectionStyle = .none
        addSubview(self.toggleSwitch)
        self.addToggleSwitchConstraint()
        self.toggleSwitch.layer.cornerRadius = self.toggleSwitch.bounds.height / 2
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
