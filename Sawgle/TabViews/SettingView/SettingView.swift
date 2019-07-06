//
//  SettingView.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 14/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class SettingView: UIView {
    let settingTableView: UITableView = {
        let settingTableView = UITableView(frame: CGRect.zero, style: .grouped)
        settingTableView.tableFooterView = UIView()
        settingTableView.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.9215686275, blue: 0.8235294118, alpha: 1)
        settingTableView.separatorStyle = .none
        return settingTableView
    }()

    func addSettingTableViewConstraint() {
        self.settingTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            settingTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            settingTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            settingTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.9215686275, blue: 0.8235294118, alpha: 1)
        addSubview(self.settingTableView)
        self.addSettingTableViewConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
