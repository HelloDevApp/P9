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
    
    let url = URL(string: "https://translation.googleapis.com/language/translate/v2")!
    
    func getTranslation(callback: @escaping (Bool, Translation?) -> Void) {
        
        guard let textEncoded = Translater.shared.textToTranslate.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed) else { callback(false, nil); return }
        let parameters = "?key=\(APIKey.shared.apiKeyTranslater)&q=\(textEncoded)&target=\(Translater.shared.targetLang)&source=fr"
        
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
            callback(true, translation_Last)
        }
        task.resume()
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
