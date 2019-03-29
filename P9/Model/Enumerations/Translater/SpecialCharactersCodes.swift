//
//  SpecialCharactersCodes.swift
//  P9
//
//  Created by Mac Book Pro on 29/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

//=====================================================
//MARK:----------------Translate-----------------------
//=====================================================

enum SpecialCharactersCodes: String, CaseIterable {
    case apostrophe, apostrophe1, apostophe2, hashtag, space, cCedillaUppercase, cCedilla
    var value: String {
        switch self {
        case .apostrophe, .apostrophe1, .apostophe2:
            return "%27"
        case .hashtag:
            return "%23"
        case .space:
            return "%20"
        case .cCedillaUppercase:
            return "%c7"
        case .cCedilla:
            return "%e7"
        }
    }
}
