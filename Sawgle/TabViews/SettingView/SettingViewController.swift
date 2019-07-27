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
    var settingOwnView: SettingView {
        return self.view as! SettingView
    }

    func makeTitleData() {
        let firstSectionTitle = SettingTitle(inputTitle: "알림장", "내 글 댓글", "즐겨찾기 새글")
        let secondSectionTitle = SettingTitle(inputTitle: "계정 관리")
        let thirdSectionTitle = SettingTitle(inputTitle: "버전 정보", "오픈 소스")
        let fourthSectionTitle = SettingTitle(inputTitle: "공지사항", "피드백")

        self.titleList.append(firstSectionTitle)
        self.titleList.append(secondSectionTitle)
        self.titleList.append(thirdSectionTitle)
        self.titleList.append(fourthSectionTitle)
    }

    override func loadView() {
        view = SettingView()
    }

    override func viewDidLoad() {
        self.settingOwnView.settingTableView.delegate = self
        self.settingOwnView.settingTableView.dataSource = self
        self.makeTitleData()
        self.navigationItem.title = "설정"
        self.registerCell()
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
            guard let settingSwitchCell = tableView.dequeueReusableCell(withIdentifier: "SwitchTableViewCell") as? SwitchTableViewCell else {
                return UITableViewCell()
            }

            settingSwitchCell.settingTitleLabel.text = self.titleList[indexPath.section].title[indexPath.row]

            return settingSwitchCell
        }

        guard let settingCell = tableView.dequeueReusableCell(withIdentifier: "SettingTableCell") as? SettingTableViewCell else {
            return UITableViewCell()
        }
        settingCell.settingTitleLabel.text = self.titleList[indexPath.section].title[indexPath.row]

        return settingCell
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_: UITableView, viewForFooterInSection _: Int) -> UIView? {
        return LineView()
    }
}

extension SettingViewController: CellProtocol {
    func registerCell() {
        self.settingOwnView.settingTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: "SettingTableCell")
        self.settingOwnView.settingTableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: "SwitchTableViewCell")
    }
}
