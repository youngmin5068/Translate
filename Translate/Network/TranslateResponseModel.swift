//
//  TranslateResponseModel.swift
//  Translate
//
//  Created by 김영민 on 2022/02/07.
//

import Foundation


struct TranslateResponseModel: Decodable {
    let message: Message
    
    var translatedText: String { message.result.translatedText }
    
    struct Message: Decodable {
        let result: Result
    }
    
    struct Result: Decodable {
        let translatedText: String
    }
}
