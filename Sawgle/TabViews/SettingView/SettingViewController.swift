//
//  SettingViewController.swift
//  Sawgle
//
//  Created by Meo MacBook Pro on 27/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit
struct SettingTitle {
    var title = [String]()

    init(inputTitle: String...) {
        inputTitle.forEach { str in
            title.append(str)
        }
    }
}

class SettingViewController: UIViewController {
    var titleList = [SettingTitle]()

    lazy var ownView: SettingView = {
        guard let convertView = view as? SettingView else {
            return SettingView()
        }

        return convertView
    }()

    func makeTitleData() {
        let firstSectionTitle = SettingTitle(inputTitle: "알림장", "내 글 댓글", "즐겨찾기 새글")
        let secondSectionTitle = SettingTitle(inputTitle: "계정 관리")
        let thirdSectionTitle = SettingTitle(inputTitle: "버전 정보", "오픈 소스")
        let fourthSectionTitle = SettingTitle(inputTitle: "공지사항", "피드백")

        titleList.append(firstSectionTitle)
        self.titleList.append(secondSectionTitle)
        self.titleList.append(thirdSectionTitle)
        self.titleList.append(fourthSectionTitle)
    }

    func registeCell() {
        self.ownView.settingTableView.register(SettingTableCell.self, forCellReuseIdentifier: "SettingTableCell")
        self.ownView.settingTableView.register(SettingTableCellWithSwitch.self, forCellReuseIdentifier: "SettingTableCellWithSwitch")
    }

    override func loadView() {
        view = SettingView()
    }

    override func viewDidLoad() {
        navigationItem.title = "settings"
        self.ownView.settingTableView.delegate = self
        self.ownView.settingTableView.dataSource = self
        self.makeTitleData()
    }

    override func viewWillAppear(_: Bool) {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "PaleBrown") ?? .brown, NSAttributedString.Key.font: UIFont().mainFont(displaySize: 20)]

        self.registeCell()
    }
}

extension SettingViewController: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return 4
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 1
        default:
            return 2
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 1 || indexPath.row == 2 {
            guard let settingSwitchCell = tableView.dequeueReusableCell(withIdentifier: "SettingTableCellWithSwitch") as? SettingTableCellWithSwitch else {
                return UITableViewCell()
            }

            settingSwitchCell.titleLabel.text = self.titleList[indexPath.section].title[indexPath.row]

            return settingSwitchCell
        }

        guard let settingCell = tableView.dequeueReusableCell(withIdentifier: "SettingTableCell") as? SettingTableCell else {
            return UITableViewCell()
        }
        settingCell.titleLabel.text = self.titleList[indexPath.section].title[indexPath.row]

        return settingCell
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_: UITableView, viewForFooterInSection _: Int) -> UIView? {
        return LineView()
    }
}

class LineView: UIView {
    let lineView: UIView = {
        let liveView = UIView()
        liveView.backgroundColor = .white
        return liveView
    }()

    func addLineViewConstraint() {
        self.lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.widthAnchor.constraint(equalTo: widthAnchor),
            lineView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 2),
            lineView.topAnchor.constraint(equalTo: topAnchor),
        ])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(self.lineView)
        self.addLineViewConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
