//
//  TranslaterService.swift
//  P9
//
//  Created by Mac Book Pro on 22/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation

class TranslaterService {
    let translater = Translater()
    let url = URL(string: "https://translation.googleapis.com/language/translate/v2")!
    
    private var session: URLSession
    
    var task: URLSessionDataTask?
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func getTranslation(callback: @escaping (Bool, Translation?) -> Void) {
        
        guard let textEncoded = translater.textToTranslate.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed) else {
            callback(false, nil)
            return
        }
        
        let parameters = "?key=\(APIKey.shared.apiKeyTranslater)&q=\(textEncoded)&target=\(translater.targetLang)&source=fr"
        
        guard let urlComplete = URL(string: "\(url)\(parameters)") else {
            print(ErrorMessages.errorURLComplete_Translater)
            return
        }
        
        let request = URLRequest(url: urlComplete)
        
        task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    print(ErrorMessages.errorDataNilOrError_Translater)
                    callback(false, nil)
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    print(ErrorMessages.errorResponseIsNotHTTPURLResponse_Translater)
                    callback(false, nil)
                    return
                }
                guard response.statusCode != 500 else {
                    print((ErrorMessages.errorStatusCode500_Translater))
                    callback(true, nil)
                    return
                }
                guard response.statusCode == 200 else {
                    print(ErrorMessages.errorStatusCode_Translater)
                    callback(false, nil)
                    return
                }
                guard let json = try? JSONDecoder().decode(TranslaterAPIResult.self, from: data) else {
                    print(ErrorMessages.errorJSONDecoder_Translater)
                    callback(false,nil)
                    return
                }
                guard let translation_Last = json.data?.translations?.last else {
                    print(ErrorMessages.errorTranslationLastNIL_Translater)
                    callback(false, nil)
                    return
                }
                callback(true, translation_Last)
            }
        }
        task?.resume()
    }
}
