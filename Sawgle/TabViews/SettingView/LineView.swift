//
//  LineView.swift
//  Sawgle
//
//  Created by Milkyo on 28/07/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class LineView: UIView {
    let lineView: UIView = {
        let liveView = UIView()
        liveView.backgroundColor = .white
        return liveView
    }()

    func makeLineViewConstraint() {
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
        self.makeLineViewConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
