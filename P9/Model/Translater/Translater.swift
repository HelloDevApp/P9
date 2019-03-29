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
    //
    var dictOfLanguagesCodes = [String:String]()
    // contains the names of the usual characters and the corresponding hexadecimal codes
    var dictOfSpecialCharactersAndCodes = [String:String]()
    
    var textToTranslate = ""
    var targetLang = ""
    
}
