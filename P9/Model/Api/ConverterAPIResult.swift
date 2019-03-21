//
//  ConverterAPIResult.swift
//  P9
//
//  Created by Mac Book Pro on 28/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation

struct Result: Decodable {

    var success: Bool?
    var timestamp: Int?
    var base: String?
    var date: String?
    var rates: Rates?
}

struct Rates: Decodable {
    var AUD: Double?
    var BTC: Double?
    var CAD: Double?
    var CHF: Double?
    var COP: Double?
    var EUR: Double?
    var GBP: Double?
    var HKD: Double?
    var ILS: Double?
    var USD: Double?
    
}
