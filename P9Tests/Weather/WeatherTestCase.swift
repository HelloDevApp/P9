//
//  WeatherTestCase.swift
//  P9Tests
//
//  Created by macbook pro on 22/04/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

@testable import P9
import XCTest

class WeatherTestCase: XCTestCase {
    
    func testCountryWeather() {
        
        XCTAssert(Weather_.shared.country.count == 2)
    }
}
