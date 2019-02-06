//
//  Data.swift
//  P9
//
//  Created by Mac Book Pro on 06/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation

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
    
    func convertToUppercased() -> String {
        switch self {
        case .aud,.btc,.cad,.chf,.cop,.eur,.gbp,.hkd,.ils,.rub,.usd:
            return self.rawValue.uppercased()
        }
    }
}

enum Languages: String, CaseIterable {
    // 🇺🇸
    case english
    // 🇪🇸
    case spanish
    // 🇫🇷
    case french
    // 🇻🇳
    case vietnam
    // 🇩🇪
    case german
    // 🇨🇳
    case chinese
    // 🇮🇹
    case italian
    
    func convertToCapitalized() -> String {
        switch self {
        case .chinese,.english,.french,.german,.italian,.spanish,.vietnam:
            return self.rawValue.capitalized
        }
    }
}

class Data {
    
    static let shared = Data()
    
    var totalNumberOfcurrency = Currency.allCases.count
    var totalNumberOfLanguages = Languages.allCases.count
    
    
}
