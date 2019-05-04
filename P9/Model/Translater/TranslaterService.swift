//
//  TranslaterService.swift
//  P9
//
//  Created by Mac Book Pro on 22/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation

class TranslaterService {
    
    var textToTranslate = Constants.stringEmpty // is empty when initializing
    
    // contains the name of the currency choosen by user
    private var _targetLang = Constants.stringEmpty // is empty when initializing
    
    var targetLang: String {
        return _targetLang
    }
    //url base
    let url = "https://translation.googleapis.com/language/translate/v2?"
    
    private var session: URLSession
    
    var task: URLSessionDataTask?
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func getTargetLang(forSetup: Bool, row: Int?) {
        guard forSetup == false && row != nil else {
            guard row == nil else { return }
            _targetLang = "\(Languages.allCases[Languages.allCases.count/2])"
            return
        }
        guard let row = row else { return }
        _targetLang = "\(Languages.allCases[row])"
    }
    
    func getTranslation(callback: @escaping (Bool, Translation?) -> Void) {
        
        guard let textEncoded = textToTranslate.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed) else {
            callback(false, nil)
            return
        }
        
        let accessKey = "key=\(APIKey.shared.apiKeyTranslater)"
        let toTranslate = "&q=\(textEncoded)"
        let source = "&source=fr"
        let target = "&target=\(targetLang)"
        
        let parameters = accessKey + toTranslate + source + target
        
        guard let urlComplete = URL(string: url + parameters) else {
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
