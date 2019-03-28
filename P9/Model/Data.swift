//
//  Data.swift
//  P9
//
//  Created by Mac Book Pro on 06/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//


class Data {
    // we use a single instance of the Data class
    static let shared = Data()
    
    // the array that is filled using the convertToArray method in the Languages enumeration
    var arrayLanguages: [String] = []
    // the array that is filled using the convertToArray method in the Currency enumeration
    var arrayCurrencies: [String] = []
    // 
    var dictOfCurrenciesNamesShortAndFull = [String:String]()
    // contains the names of the usual characters and the corresponding hexadecimal codes
    var dictOfSpecialCharactersAndCodes = [String:String]()
    //
    var dictOfLanguagesCodes = [String:String]()
    
}
