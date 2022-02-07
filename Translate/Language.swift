//
//  Language.swift
//  Translate
//
//  Created by 김영민 on 2022/02/04.
//

import Foundation

enum Language: String,CaseIterable,Codable {
    case ko
    case en
    case ja
    case ch = "zh-CN"
    
    var title: String {
        switch self {
        case .ko: return "한국어"
        case .en: return "영어"
        case .ja: return "일본어"
        case .ch: return "중국어"
        }
    }
    
    var languageCode: String {
        self.rawValue
    }
}
