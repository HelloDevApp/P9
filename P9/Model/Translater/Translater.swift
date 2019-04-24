//
//  Translater.swift
//  P9
//
//  Created by Mac Book Pro on 30/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation

class Translater {
    
    static var shared = Translater()
    
    // the array that is filled using the convertToArray method in the Languages enumeration
    var arrayLanguages: [String] = []
    
    var dictOfLanguagesCodes = [String:String]()
    // contains the names of the usual characters and the corresponding hexadecimal codes
    var dictOfSpecialCharactersAndCodes = [String:String]()
    
    var textToTranslate = Constants.stringEmpty
    private var _targetLang = Constants.stringEmpty
    
    var targetLang: String {
        return _targetLang
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
}
