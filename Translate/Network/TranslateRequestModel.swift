//
//  TranslateRequestModel.swift
//  Translate
//
//  Created by 김영민 on 2022/02/07.
//

import Foundation


struct TranslateRequestModel : Codable {
    let source: String
    let target: String
    let text: String
}
