//
//  TranslatorManager.swift
//  Translate
//
//  Created by 김영민 on 2022/02/07.
//

import Foundation
import Alamofire

struct TranslatorManager {
    var sourceLanguage: Language = .ko
    var targetLanguage: Language = .en
    
    
    func translate(from text: String, completionHandler: @escaping (String) -> Void) {
        guard let url = URL(string: "https://openapi.naver.com/v1/papago/n2mt") else {return}
        
        let requestModel = TranslateRequestModel(
            source: sourceLanguage.languageCode,
            target: targetLanguage.languageCode,
            text: text
        )
        
        let header: HTTPHeaders = [
            "X-Naver-Client-Id": "7FIv_Gt3fYOeyug9rza4",
            "X-Naver-Client-Secret" : "5Pb4z_BNG0"
        ]
        
        AF.request(url, method: .post, parameters: requestModel, headers: header)
            .responseDecodable(of: TranslateResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.translatedText)
                case .failure(let error) :
                    print(error)
                }
            }.resume()
    }
}
