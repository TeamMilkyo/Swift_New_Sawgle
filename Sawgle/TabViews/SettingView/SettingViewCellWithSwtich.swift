//
//  SettingViewCellWithSwtich.swift
//  Sawgle
//
//  Created by Milkyo on 28/07/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class SwitchTableViewCell: SettingTableViewCell {
    let toggleSwitch: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.onTintColor = ColorList.lightGreyGreen
        toggleSwitch.layer.backgroundColor = ColorList.beige?.cgColor
        return toggleSwitch
    }()

    func makeToggleSwitchConstraint() {
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
        self.makeToggleSwitchConstraint()
        self.toggleSwitch.layer.cornerRadius = self.toggleSwitch.bounds.height / 2
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
