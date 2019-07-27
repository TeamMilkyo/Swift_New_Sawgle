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
        let heartImageView = UIImageView(image: #imageLiteral(resourceName: "heart"))
        heartImageView.contentMode = .scaleAspectFit
        return heartImageView
    }()

    let heartCountLabel: UILabel = {
        let heartCountLabel = UILabel()
        heartCountLabel.font = UIFont(name: "S-CoreDream-2ExtraLight", size: 10)
        heartCountLabel.text = "0"
        heartCountLabel.adjustsFontSizeToFitWidth = true
        heartCountLabel.contentMode = .scaleAspectFit
        return heartCountLabel
    }()

    // MARK: - Setting Methods

    func initHearCount() {
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

    func addCellHeartViewSubviews() {
        addSubview(self.heartImageView)
        addSubview(self.heartCountLabel)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initHearCount()
        self.addCellHeartViewSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
