//
//  Data.swift
//  P9
//
//  Created by Mac Book Pro on 06/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation

class Data {
    // we use a single instance of the Data class
    static let shared = Data()
    
    // the array that is filled using the convertToArray method in the Languages enumeration
    var arrayLanguages: [String] = []
    // the array that is filled using the convertToArray method in the Currency enumeration
    var arrayCurrencies: [String] = []
    
    
    var currenciesName = [String:String]()
    
    // allows to fill a array according to the enumeration chosen in parameter
    func enumCaseToArrayOrDictionnary(enumeration: ListofEnumeration) {
        if enumeration == .Languages {
            Languages.convertToArray()
        } else if enumeration == .Currencies {
            Currencies.convertToArray()
        } else if enumeration == .CurrenciesNames {
            CurrenciesNames.convertToDictionnary()
        }
    }
}
