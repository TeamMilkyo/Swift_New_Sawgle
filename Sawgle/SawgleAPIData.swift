//
//  SawgleAPIData.swift
//  Sawgle
//
//  Created by Min Kyeong Tae on 19/06/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

struct ReplyData {
    var nickName: String
    var postText: String
    var postDate: String
    var heartCount: Int

    init(text: String) {
        let dateFormatter = DateFormatter()
        let nowDate = Date()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy.MM.dd a h:mm"
        self.postDate = dateFormatter.string(from: nowDate)
        self.nickName = " " // 닉네임
        self.postText = text
        self.heartCount = 0
    }
}

// MARK: - POST REQUEST

struct ReplyPostData: Codable {
    let nickName: String
    let postText: String = {
        let dateFormatter = DateFormatter()
        let nowDate = Date()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy.MM.dd a h:mm"
        let postText = dateFormatter.string(from: nowDate)
        return postText
    }()

    let postDate: String
    let heartCount: Int

    enum CodingKeys: String, CodingKey {
        case nickName, postText, postDate, heartCount
    }
}
