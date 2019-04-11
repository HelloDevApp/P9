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
        
        cityLeft.text = "Ville"
        dateLeft.text = "../../...."
        currentTempLeft.text = "..°"
        descriptionLeft.text = "Description: .."
        humidityLeft.text = "Humidité: ..%"

        cityRight.text = "Ville"
        dateRight.text = "../../...."
        currentTempRight.text = "..°"
        descriptionRight.text = "Description: .."
        humdidityRight.text = "Humidité: ..%"
    }
    
    func updateCity(result: List, leftOrRight city: CustomLabel) {
        
        guard let resultCity = result.name else {
            alert(message: Error_.noCity.rawValue, title: Error_.oupps.rawValue)
            return
        }
        
        let cityName = resultCity
        DispatchQueue.main.async {
            city.text = cityName
        }
    }
    
    func updateDate() {
        DispatchQueue.main.async {
            self.dateLeft.text = self.returnCurrentDate()
            self.dateRight.text = self.returnCurrentDate()
        }
    }
    
    // returns the current date in a custom format
    func returnCurrentDate() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        let date = formatter.string(from: currentDate)
        return date
    }
    
    func updateTemp(result: List, labelTemp: UILabel) {
        
        guard let resultMain = result.main else {
            alert(message: Error_.noTemp.rawValue, title: Error_.oupps.rawValue)
            return
        }
        
        guard let resultTemp = resultMain.temp else {
            alert(message: Error_.noTemp.rawValue, title: Error_.oupps.rawValue)
            return
        }
        let tempInt = Int(resultTemp)
        DispatchQueue.main.async {
            labelTemp.text = String(tempInt) + "°"
        }
    }
    
    func updateDescription(result: List, descriptionLabel: CustomLabel) {
        // Weather
        guard let resultWeather = result.weather else {
            alert(message: Error_.noDescription.rawValue, title: Error_.oupps.rawValue)
            return
        }
        // last weather
        guard let resultWeatherLast = resultWeather.first else {
            alert(message: Error_.noDescription.rawValue, title: Error_.oupps.rawValue)
            return
        }
        // last description
        guard let description = resultWeatherLast.description else {
            alert(message: Error_.noDescription.rawValue, title: Error_.oupps.rawValue)
            return
        }
        DispatchQueue.main.async {
            descriptionLabel.text = description.capitalized
        }
    }
    
    func updateHumidity(result: List, labelHumidity: CustomLabel) {
        
        guard let resultMain = result.main else {
            alert(message: Error_.noHumidity.rawValue, title: Error_.oupps.rawValue)
            return
        }
        // humidity right
        guard let result = resultMain.humidity else {
            alert(message: Error_.noHumidity.rawValue, title: Error_.oupps.rawValue)
            return
        }
            DispatchQueue.main.async {
                labelHumidity.text = "Humidité: " + String(result) + "%"
            }
    }
}
