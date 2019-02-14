//
//  Data.swift
//  P9
//
//  Created by Mac Book Pro on 06/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation

enum ListofEnumeration {
    case Currency, Languages
}

enum Currency: String, CaseIterable {
    
    // Euro
    case eur
    // Cannadian Dollar
    case cad
    // United State Dollard
    case usd
    // Bitcoins
    case btc
    // Australian Dollard
    case aud
    // British Pound Sterling
    case gbp
    // Israeli New Sheqel
    case ils
    // Swiss Franc
    case chf
    // Colombian Peso
    case cop
    // Hong Kong Dollar
    case hkd
    // Russian Ruble
    case rub
    // allows you to fill in a array containing all the cases of the enumeration
    static func convertToArray() {
        //
        for value in Currency.allCases {
            // for currencies, we use the uppercased() method to have all the text in capitals.
            Data.shared.arrayCurrency.append(value.rawValue.uppercased())
        }
    }
}

enum Languages: String, CaseIterable {
    // 🇺🇸
    case english = "Anglais"
    // 🇪🇸
    case spanish = "Espagnol"
    // 🇫🇷
    case french = "Français"
    // 🇻🇳
    case vietnam = "Vietnamien"
    // 🇩🇪
    case german = "Allemand"
    // 🇨🇳
    case chinese = "Chinois"
    // 🇮🇹
    case italian = "Italien"
    // allows you to fill in a array containing all the cases of the enumeration
    static func convertToArray() {
        for value in Languages.allCases {
            // for languages, we use the capitalized() method to have a capital letter in the first letter
            Data.shared.arrayLanguage.append(value.rawValue.capitalized)
        }
    }
}

class Data {
    // we use a single instance of the Data class
    static let shared = Data()
    
    // the array that is filled using the convertToArray method in the Languages enumeration
    var arrayLanguage: [String] = []
    // the array that is filled using the convertToArray method in the Currency enumeration
    var arrayCurrency: [String] = []
    
    // allows to fill a array according to the enumeration chosen in parameter
    func enumCaseToArray(enumeration: ListofEnumeration) {
        if enumeration == .Languages {
            Languages.convertToArray()
        } else if enumeration == .Currency {
            Currency.convertToArray()
        }
    }
}
