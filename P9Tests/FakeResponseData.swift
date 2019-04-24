//
//  FakeResponseData.swift
//  P9Tests
//
//  Created by macbook pro on 21/04/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation

class ErrorProtocol: Error {}

class FakeResponseData {
    
    let incorrectData = "erreur".data(using: .utf8)!

    // Converter
    var correctDataConversion: Data {
        let data = recoverUrlJSONFiles(nameJson: "Conversion")
        return data
    }
    
    var dataConversionWithoutRates: Data {
        let data = recoverUrlJSONFiles(nameJson: "ConversionWithoutRates")
        return data
    }
    
    var dataConversionWithoutTimestamp: Data {
        let data = recoverUrlJSONFiles(nameJson: "ConversionWithoutTimestamp")
        return data
    }
    
    // Translater
    var correctDataTranslation: Data {
        let data = recoverUrlJSONFiles(nameJson: "Translation")
        return data
    }
    
    var incompleteDataTranslation: Data {
        let data = recoverUrlJSONFiles(nameJson: "TranslationWithoutTranslations")
        return data
    }
    
    // Weather
    var correctDataWeather: Data {
        let data = recoverUrlJSONFiles(nameJson: "Weather")
        return data
    }
    
    var weatherDataWithoutLeftWeather: Data {
        let data = recoverUrlJSONFiles(nameJson: "WeatherWithoutWeatherFirst")
        return data
    }
    
    var weatherDataWithoutRightWeather: Data {
        let data = recoverUrlJSONFiles(nameJson: "WeatherWithoutWeatherSecond")
        return data
    }
    
    var weatherDataWithoutRightIcon: Data {
        let data = recoverUrlJSONFiles(nameJson: "WeatherWithoutIconLeft")
        return data
    }
    
    var weatherDataWithoutLeftIcon: Data {
        let data = recoverUrlJSONFiles(nameJson: "WeatherWithoutIconRight")
        return data
    }
    
    let image = "image".data(using: .utf8)
    
    // All
    let responseOK = HTTPURLResponse(url: URL(string: "www.test.com")!, statusCode: 200, httpVersion: nil, headerFields: [:])
    let responseNotOK =  HTTPURLResponse(url: URL(string: "www.test.com")!, statusCode: 500, httpVersion: nil, headerFields: [:])
    let responseNotOK2 =  HTTPURLResponse(url: URL(string: "www.test.com")!, statusCode: 400, httpVersion: nil, headerFields: [:])
    let responseNotTypeHTTPURLResponse = URLResponse(url: URL(string: "www.testURL.com")!, mimeType: nil, expectedContentLength: 0, textEncodingName: nil)
    
    let error = ErrorProtocol()
    
    func recoverUrlJSONFiles(nameJson: String) -> Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: nameJson, withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
}
