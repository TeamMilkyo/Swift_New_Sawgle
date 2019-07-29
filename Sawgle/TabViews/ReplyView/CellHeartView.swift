//
//  CellHeartView.swift
//  Sawgle
//
//  Created by Milkyo on 28/07/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

// MARK: - 댓글 테이블뷰 댓글셀 내 하트뷰

class CellHeartView: UIView {
    // MARK: properties

    private var heartCount = 0
    private var isHeartCounting = false

    let heartImageView: UIImageView = {
        let heartImageView = UIImageView(image: UIImage(named: "heart"))
        heartImageView.contentMode = .scaleAspectFit
        return heartImageView
    }()

    let heartCountLabel: UILabel = {
        let heartCountLabel = UILabel()
        heartCountLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 10)
        heartCountLabel.text = "0"
        heartCountLabel.textColor = UIColor.black
        heartCountLabel.clipsToBounds = true
//        heartCountLabel.adjustsFontSizeToFitWidth = true
        return heartCountLabel
    }()

    // MARK: - Setting Methods

    func initHeartCount() {
        self.heartCount = 0
        self.heartCountLabel.text = "\(self.heartCount)"
    }

    func setHeartCount(count: Int) {
        self.heartCountLabel.text = "\(count)"
    }

    func changeHeartCount() {
        if self.isHeartCounting == false {
            self.heartCount += 1
            self.heartCountLabel.text = "\(self.heartCount)"
            self.isHeartCounting = true
        } else {
            self.heartCount -= 1
            self.heartCountLabel.text = "\(self.heartCount)"
            self.isHeartCounting = false
        }
    }

    func makeHeartImageViewConstraint() {
        self.heartImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heartImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            self.heartImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            self.heartImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            self.heartImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, constant: 0.6),
        ])
    }

    func makeHeartCountLabelConstraint() {
        self.heartCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heartCountLabel.centerXAnchor.constraint(equalTo: self.heartImageView.centerXAnchor),
            self.heartCountLabel.topAnchor.constraint(equalTo: self.heartImageView.bottomAnchor, constant: 3),
            self.heartCountLabel.widthAnchor.constraint(equalTo: self.heartImageView.widthAnchor),
            self.heartCountLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeSubView()
        self.makeSubViewConstraint()
        self.initHeartCount()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension CellHeartView: UIViewItemProtocol {
    func makeSubView() {
        addSubview(self.heartImageView)
        addSubview(self.heartCountLabel)
    }

    func makeSubViewConstraint() {
        self.makeHeartImageViewConstraint()
        self.makeHeartCountLabelConstraint()
    }
}
