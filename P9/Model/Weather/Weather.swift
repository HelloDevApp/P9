//
//  Weather.swift
//  P9
//
//  Created by Mac Book Pro on 30/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation


class Weather_ {
    
    static let shared = Weather_()
    
    private let _country = [Constants.cityNewYork, Constants.cityNewYork]
    
    var country: [String] {
        return _country
    }
    
}
