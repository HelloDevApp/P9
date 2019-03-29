//
//  TranslaterService.swift
//  P9
//
//  Created by Mac Book Pro on 22/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation

class TranslaterService {
    
    static var shared = TranslaterService()
    
    var textToTranslate = ""
    var targetLang = ""
    let url = URL(string: "https://translation.googleapis.com/language/translate/v2")!
    
    func getTranslation(callback: @escaping (Bool, Translation?) -> Void) {
        
        let parameters = "?key=\(APIKey.shared.apiKeyTranslater)&q=\(textToTranslate)&target=\(targetLang)&source=fr"
        print(parameters)
        guard let urlComplete = URL(string: "\(url)\(parameters)") else { print("erreur ulrComplete"); return }
        print(urlComplete)
        let session = URLSession(configuration: .default)
        
        let request = URLRequest(url: urlComplete)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else { print("erreur data nil || error "); callback(false, nil); return }
            guard let json = try? JSONDecoder().decode(TranslaterAPIResult.self, from: data) else { print("erreur json decoder"); callback(false,nil); return }
            guard let json_Data = json.data else { print("erreur3"); callback(false, nil); return }
            guard let json_Data_Translations = json_Data.translations else { print("erreur json data translations nil"); callback(false, nil); return }
            guard let translation_Last = json_Data_Translations.last else { print("erreur  translations last nil"); callback(false, nil); return }
            guard let translation = translation_Last.translatedText else { print("tranlation nil"); callback(false, nil); return }
            let translations = Translation(translatedText: translation)
            callback(true, translations)
        }
        task.resume()
    }
    
    func replaceMultipleCharactersForRequest() {
        for character in textToTranslate {
            for (key, value) in Data.shared.dictOfSpecialCharactersAndCodes {
                let keyCharacter = Character(key)
                if character == keyCharacter {
                    textToTranslate = textToTranslate.replacingOccurrences(of: key, with: value)
                    break
                }
            }
        }
        print(textToTranslate)
    }
    
    func replaceCharactersOfTranslatedText(translatedText: String) -> String {
        var translatedText = translatedText
        let findValue = "&#39;"
        let replaceValue = "'"
        if translatedText.contains(findValue) {
            translatedText = translatedText.replacingOccurrences(of: findValue, with: replaceValue)
            return translatedText
        }
        return translatedText
    }
}
