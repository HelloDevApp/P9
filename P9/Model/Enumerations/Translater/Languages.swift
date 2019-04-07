//
//  Languages.swift
//  P9
//
//  Created by Mac Book Pro on 29/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

//=====================================================
//MARK:----------------Translate-----------------------
//=====================================================
enum Languages: String, CaseIterable {
    // 🇺🇸 english
    case en = "Anglais"
    // 🇪🇸 spanish
    case es = "Espagnol"
    // 🇻🇳 vietnam
    case vi = "Vietnamien"
    // 🇩🇪 german
    case de = "Allemand"
    // 🇨🇳 korean
    case ko = "Coréen"
    // 🇮🇹 italian
    case it = "Italien"
}

//=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
//MARK:-+-+-+-+-+--+-+-+-Extensions-+-+-+-+-+--+-+-+-+-
//=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
extension Languages {
    // allows you to fill in a array containing all the cases of the enumeration
    static func convertToArray() {
        for value in Languages.allCases {
            // for languages, we use the capitalized() method to have a capital letter in the first letter
            Translater.shared.arrayLanguages.append(value.rawValue.capitalized)
        }
    }
}
