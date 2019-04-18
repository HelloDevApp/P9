//
//  ExtensionWeatherViewController.swift
//  P9
//
//  Created by Mac Book Pro on 29/03/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation
import UIKit

extension WeatherViewController {
    
    func setup() {
        // Left
        cityLeft.text = Constants.defaultCity
        dateLeft.text = Constants.defaultDate
        currentTempLeft.text = Constants.defaultTemp
        descriptionLeft.text = Constants.defaultDescr
        humidityLeft.text = Constants.defaultHumidity

        // Right
        cityRight.text = Constants.defaultCity
        dateRight.text = Constants.defaultDate
        currentTempRight.text = Constants.defaultTemp
        descriptionRight.text = Constants.defaultDescr
        humdidityRight.text = Constants.defaultHumidity
    }
    
    func updateCity(result: List, leftOrRight city: CustomLabel) {
        
        guard let resultCity = result.name else {
            alert(message: ErrorMessages.noCity.rawValue, title: ErrorMessages.oupps.rawValue)
            return
        }
        
        let cityName = resultCity
        city.text = cityName
        
    }
    
    func updateDate() {
            self.dateLeft.text = self.returnCurrentDate()
            self.dateRight.text = self.returnCurrentDate()
        
    }
    
    // returns the current date in a custom format
    func returnCurrentDate() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormat
        let date = formatter.string(from: currentDate)
        return date
    }
    
    func updateTemp(result: List, labelTemp: UILabel) {
        
        guard let resultMain = result.main else {
            alert(message: ErrorMessages.noTemp.rawValue, title: ErrorMessages.oupps.rawValue)
            return
        }
        
        guard let resultTemp = resultMain.temp else {
            alert(message: ErrorMessages.noTemp.rawValue, title: ErrorMessages.oupps.rawValue)
            return
        }
        let tempInt = Int(resultTemp)
        labelTemp.text = String(tempInt) + Constants.degrees
        
    }
    
    func updateDescription(result: List, descriptionLabel: CustomLabel) {
        // Weather
        guard let resultWeather = result.weather else {
            alert(message: ErrorMessages.noDescription.rawValue, title: ErrorMessages.oupps.rawValue)
            return
        }
        // first weather
        guard let resultWeatherLast = resultWeather.first else {
            alert(message: ErrorMessages.noDescription.rawValue, title: ErrorMessages.oupps.rawValue)
            return
        }
        // last description
        guard let description = resultWeatherLast.description else {
            alert(message: ErrorMessages.noDescription.rawValue, title: ErrorMessages.oupps.rawValue)
            return
        }
        descriptionLabel.text = description.capitalized
    }
    
    func updateHumidity(result: List, labelHumidity: CustomLabel) {
        
        guard let resultMain = result.main else {
            alert(message: ErrorMessages.noHumidity.rawValue, title: ErrorMessages.oupps.rawValue)
            return
        }
        // humidity right
        guard let result = resultMain.humidity else {
            alert(message: ErrorMessages.noHumidity.rawValue, title: ErrorMessages.oupps.rawValue)
            return
        }
        labelHumidity.text = Constants.humidity + String(result) + Constants.purcent
    }
}
