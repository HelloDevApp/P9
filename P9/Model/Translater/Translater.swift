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
    
    
    var textToTranslate = Constants.stringEmpty // is empty when initializing
    
    // contains the name of the currency choosen by user
    private var _targetLang = Constants.stringEmpty // is empty when initializing
    
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
