//
//  ModelDiary.swift
//  Diary
//
//  Created by JongHyun Park on 2020/06/11.
//  Copyright © 2020 zehye. All rights reserved.
//

import UIKit

public enum Weather {
    // 비
    case Rainy
    // 눈
    case Snowy
    // 흐림
    case Cloudy
    // 맑음
    case Sunny
}

class ModelDiary: BaseModel {
    // 날짜
    var date:Date = Date()
    // 날씨
    var weather:Weather = .Sunny
    // 기상시간
    var wakeup = Date()
    // 취침시간
    var bedTime = Date()
    // 사진
    var picture = UIImage()
    // 사진 경로
    var pictureUrl = String()
    // 본문
    var content = String()
    // 잘한일
    var good = String()
    // 못한일
    var bad = String()
    // 행복했던일
    var happy = String()
    // 제일 죽이고 싶은 놈
    var kill = String()
    
    override init(_ dictionary: Dictionary<String, Any>) {
        super.init(dictionary)
    }
    
    
}
