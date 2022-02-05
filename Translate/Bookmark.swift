//
//  Bookmark.swift
//  Translate
//
//  Created by 김영민 on 2022/02/05.
//

import Foundation


struct Bookmark: Codable {
    let sourceLanguage: Language
    let translatedLanguage: Language
    
    let sourceText: String
    let translatedText: String
}

