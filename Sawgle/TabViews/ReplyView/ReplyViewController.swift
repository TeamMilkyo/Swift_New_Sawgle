//
//  ReplyViewController.swift
//  Sawgle
//
//  Created by Min Kyeong Tae on 16/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

// MARK: ReplyTableView 섹션 분류

///
/// - textTableViewSection: 메인 타이을, 텍스트뷰 섹션
/// - postTableViewSection: 댓글입력, 댓글텍스트뷰 섹션
enum ReplyTableViewSections: Int {
    case textTableViewSection = 0
    case postTableViewSection = 1
}

// MARK: - 댓글 뷰컨트롤러

class ReplyViewController: UIViewController {
    // MARK: - Properties

    let replyTextTableViewCellIdentifier = "replyTextTableViewCell"
    let replyPostTableViewCellIdentifier = "replyPostTableViewCell"
    var isKeyboard = false
    var replyViewPostData: [ReplyData] = []

    lazy var replyView: ReplyView = {
        guard let replyView = view as? ReplyView else { return ReplyView() }
        return replyView
    }()

    let replyPostHeaderView: ReplyPostHeaderView = {
        let replyPostHeaderView = ReplyPostHeaderView()
        return replyPostHeaderView
    }()

    // MARK: tapGestureRecognizer

    lazy var starCountButtonTapGestureRecognizer: UITapGestureRecognizer = {
        UITapGestureRecognizer(target: self, action: #selector(starBarButtonImageViewPressed(_:)))
    }()

    lazy var heartButtonTapGestureRecognizer: UITapGestureRecognizer = {
        UITapGestureRecognizer(target: self, action: #selector(heartImageViewPressed(_:)))
    }()

    lazy var replyTableViewTapGestureRecognizer: UITapGestureRecognizer = {
        UITapGestureRecognizer(target: self, action: #selector(replyTableViewPressed(_:)))
    }()

    lazy var replyViewPostButtonLongPressGestureRecognizer: UILongPressGestureRecognizer = {
        let replyViewPostButtonRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(replyPostButtonPressed(_:)))
        replyViewPostButtonRecognizer.minimumPressDuration = 0
        return replyViewPostButtonRecognizer
    }()

    // MARK: navigationItemTitle UI

    let navigationItemTitleStackView: UIStackView = {
        let navigationItemTitleStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navigationItemTitleStackView.alignment = .center
        navigationItemTitleStackView.axis = .vertical
        navigationItemTitleStackView.spacing = 1
        return navigationItemTitleStackView
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        titleLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 12.3)
        titleLabel.tintColor = UIColor(named: "greyishBrown")
        return titleLabel
    }()

    let titleImageView: UIImageView = {
        let titleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        titleImageView.image = #imageLiteral(resourceName: "logo")
        titleImageView.contentMode = .scaleAspectFit
        return titleImageView
    }()

    // MARK: starBarButtonItem UI

    let starBarButtonItemStackView: UIStackView = {
        let starBarButtonItemStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        starBarButtonItemStackView.alignment = .center
        starBarButtonItemStackView.axis = .vertical
        starBarButtonItemStackView.spacing = -5
        return starBarButtonItemStackView
    }()

    let starCountLabel: UILabel = {
        let starCountLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        starCountLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 10)
        starCountLabel.tintColor = UIColor(named: "greyishBrown")
        return starCountLabel
    }()

    let starButtonImageView: UIImageView = {
        let starButtonImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        starButtonImageView.image = #imageLiteral(resourceName: "star")
        starButtonImageView.contentMode = .scaleAspectFit
        return starButtonImageView
    }()

    // MARK: - viewController Delegate

    override func loadView() {
        self.view = ReplyView()
    }

    override func viewDidLoad() {
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.setKeyboardEvent()
        self.setReplyTableView()
        self.registerTableViewCell()
        self.setBackBarButtonItem()
        self.setNavigationItemTitleStackView(titleName: " ") // 네비게이션바 타이틀
        self.setStarBarButtonItem(count: 10)
        self.setConstraints()
    }

    override func viewWillDisappear(_: Bool) {
        super.viewWillDisappear(true)
        self.removeKeyboardEvent()
    }

    // MARK: - setting Methods

    func setKeyboardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillAppear(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillDisappear(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func removeKeyboardEvent() {
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillHideNotification)
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillShowNotification)
    }

    func postReplyContents() {
        if self.replyPostHeaderView.postHeaderTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty == false {
            // 이 시점의 닉네임, 시간값, 포스팅내용, 하트수치를 저장하여 서버에 POST처리 후, 테이블뷰셀에 기록한다.

            // MARK: 서버 구현 전 테스트 용 코드

            guard let textData = replyPostHeaderView.postHeaderTextField.text else { return }

            let replyData = ReplyData(text: textData)
            self.replyViewPostData.append(replyData)
            self.replyPostHeaderView.postHeaderTextField.text = ""
            self.replyPostHeaderView.setPostReplyCount(count: self.replyViewPostData.count)

            DispatchQueue.main.async {
                self.replyView.replyTableView.reloadData()
            }

        } else {
            let replyPostAlertController = UIAlertController(title: "댓글 미입력", message: "댓글을 입력해주세요", preferredStyle: UIAlertController.Style.alert)
            let replyPostAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            replyPostAlertController.addAction(replyPostAlertAction)
            self.present(replyPostAlertController, animated: true, completion: nil)
        }
    }

    func setBackBarButtonItem() {
        let backButton = UIButton(type: .custom)
        let originImage = #imageLiteral(resourceName: "Back")
        let renderingImage = originImage.withRenderingMode(.alwaysTemplate)
        backButton.setImage(renderingImage, for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        backButton.tintColor = UIColor(named: "PinkishGrey")
        backButton.addTarget(self, action: #selector(self.backButtonPressed(_:)), for: UIControl.Event.touchUpInside)
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    }

    func setReplyTableView() {
        self.replyView.replyTableView.dataSource = self
        self.replyView.replyTableView.delegate = self
        self.replyView.replyTableView.estimatedRowHeight = 50
        self.replyView.replyTableView.rowHeight = UITableView.automaticDimension
        self.replyView.replyTableView.addGestureRecognizer(self.replyTableViewTapGestureRecognizer)
    }

    func setNavigationItemTitleStackView(titleName: String) {
        self.titleLabel.text = "\(titleName)"
        self.navigationItemTitleStackView.addArrangedSubview(self.titleImageView)
        self.navigationItemTitleStackView.addArrangedSubview(self.titleLabel)
        navigationItem.titleView = self.navigationItemTitleStackView
    }

    func setStarBarButtonItem(count: Int) {
        self.starCountLabel.text = "\(count)"
        self.starBarButtonItemStackView.addArrangedSubview(self.starButtonImageView)
        self.starBarButtonItemStackView.addArrangedSubview(self.starCountLabel)
        self.starBarButtonItemStackView.addGestureRecognizer(self.starCountButtonTapGestureRecognizer)
        let starBarButtonItem = UIBarButtonItem(customView: starBarButtonItemStackView)
        self.navigationItem.rightBarButtonItem = starBarButtonItem
    }

    func registerTableViewCell() {
        self.replyView.replyTableView.register(ReplyTextTableViewCell.self, forCellReuseIdentifier: self.replyTextTableViewCellIdentifier)
        self.replyView.replyTableView.register(ReplyPostTableViewCell.self, forCellReuseIdentifier: self.replyPostTableViewCellIdentifier)
    }

    // MARK: setConstraints

    func setConstraints() {
        self.starButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        self.starCountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleImageView.translatesAutoresizingMaskIntoConstraints = false
        self.starBarButtonItemStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            starButtonImageView.heightAnchor.constraint(equalTo: starCountLabel.heightAnchor, multiplier: 0.63),
            starButtonImageView.topAnchor.constraint(equalTo: starBarButtonItemStackView.topAnchor, constant: 5),
        ])

        NSLayoutConstraint.activate([
            titleImageView.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, multiplier: 0.63),

        ])
    }

    // MARK: - Getting Methods

    func getKeyboardHeight(_ sender: Notification) -> CGFloat {
        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return CGFloat.leastNormalMagnitude }
        return keyboardFrame.cgRectValue.height
    }

    // MARK: - TouchEvents Methods

    // MARK: tapGestureRecognizer Event Methods

    @objc func backButtonPressed(_: UIButton) {
        self.dismissCustomTransition()
    }

    @objc func starBarButtonImageViewPressed(_: UITapGestureRecognizer) {}

    @objc func heartImageViewPressed(_: UITapGestureRecognizer) {}

    @objc func replyTableViewPressed(_: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @objc func replyPostButtonPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .ended {
            self.postReplyContents()

            self.replyPostHeaderView.postHeaderButton.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        } else { self.replyPostHeaderView.postHeaderButton.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1) }
    }

    // MARK: cellHeartView Touch Event Method

    ///
    /// - Parameter sender: 댓글 테이블뷰셀 내 하트버튼 터치시 동작하는 CellHeartView 이벤트
    @objc func cellHeartViewPressed(_ sender: UITapGestureRecognizer) {
        guard let selectedCellHeartView = sender.view as? CellHeartView else { return }

        // MARK: will POST cellHeartView touch Event

        selectedCellHeartView.changeHeartCount()
    }

    // MARK: Keyboard delegate Methods

    @objc func keyboardWillAppear(_ sender: Notification) {
        let keyboardHeight = self.getKeyboardHeight(sender)

        if self.isKeyboard == false {
            self.isKeyboard = true
            self.view.frame.origin.y -= keyboardHeight
        }
    }

    @objc func keyboardWillDisappear(_ sender: Notification) {
        let keyboardHeight = self.getKeyboardHeight(sender)

        if self.isKeyboard == true {
            self.isKeyboard = false
            self.view.frame.origin.y += keyboardHeight
        }
    }
}

extension ReplyViewController: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return 2
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let replyViewSection = ReplyTableViewSections(rawValue: section) else { return 0 }
        switch replyViewSection {
        case .textTableViewSection: return 1
        case .postTableViewSection: return self.replyViewPostData.count // 추후에는 댓글갯수만큼만 반환
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let replyTextTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.replyTextTableViewCellIdentifier, for: indexPath) as? ReplyTextTableViewCell else { return UITableViewCell() }
            replyTextTableViewCell.backgroundColor = UIColor(named: "Pale")
            return replyTextTableViewCell
        } else {
            guard let replyPostTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.replyPostTableViewCellIdentifier, for: indexPath) as? ReplyPostTableViewCell else { return UITableViewCell() }
            replyPostTableViewCell.setPostTableViewCellData(replyData: self.replyViewPostData.reversed()[indexPath.row])
            replyPostTableViewCell.backgroundColor = UIColor(named: "Pale")

            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.cellHeartViewPressed(_:)))
            tapGestureRecognizer.numberOfTapsRequired = 1
            replyPostTableViewCell.heartView.isUserInteractionEnabled = true
            replyPostTableViewCell.heartView.tag = indexPath.row
            replyPostTableViewCell.heartView.addGestureRecognizer(tapGestureRecognizer)
            return replyPostTableViewCell
        }
    }
}

extension ReplyViewController: UITableViewDelegate {
    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let replyTableViewSection = ReplyTableViewSections(rawValue: section) else { return UIView() }

        switch replyTableViewSection {
        case .textTableViewSection:
            let replyTextHeaderView = ReplyTextHeaderView()
            replyTextHeaderView.backgroundColor = UIColor(named: "Pale")
            replyTextHeaderView.heartImageView.isUserInteractionEnabled = true
            replyTextHeaderView.heartImageView.addGestureRecognizer(self.heartButtonTapGestureRecognizer)
            return replyTextHeaderView
        case .postTableViewSection:
            self.replyPostHeaderView.backgroundColor = UIColor(named: "Pale")
            self.replyPostHeaderView.postHeaderButton.isUserInteractionEnabled = true
            self.replyPostHeaderView.postHeaderButton.addGestureRecognizer(self.replyViewPostButtonLongPressGestureRecognizer)
            return self.replyPostHeaderView
        }
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let replyTableViewSection = ReplyTableViewSections(rawValue: section) else { return .leastNonzeroMagnitude }

        switch replyTableViewSection {
        case .textTableViewSection: return 80
        case .postTableViewSection: return 80
        }
    }

    func tableView(_: UITableView, heightForFooterInSection _: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
}
