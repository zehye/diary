//
//  ModelPlan.swift
//  Diary
//
//  Created by 졔님 on 2020/07/21.
//  Copyright © 2020 zehye. All rights reserved.
//

import UIKit

class ModelPlan: BaseModel {

    // 제목
    var title = String()
    // 날짜
    var date: Date = Date()
    // 위치
    var location = String()
    // 공유 링크
    var link = String()
    // 메모
    var memo = String()
    
    override init() {
        super.init()
    }
    
    override init(_ dictionary: Dictionary<String, Any>) {
        super.init(dictionary)
    }
}
