//
//  WeatherViewController.swift
//  P9
//
//  Created by Mac Book Pro on 28/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityLeft: CustomLabel!
    @IBOutlet weak var dateLeft: UILabel!
    @IBOutlet weak var iconLeft: UIImageView!
    @IBOutlet weak var currentTempLeft: UILabel!
    @IBOutlet weak var descriptionLeft: CustomLabel!
    @IBOutlet weak var humidityLeft: CustomLabel!
    @IBOutlet weak var cityRight: CustomLabel!
    @IBOutlet weak var dateRight: UILabel!
    @IBOutlet weak var iconRight: UIImageView!
    @IBOutlet weak var currentTempRight: UILabel!
    @IBOutlet weak var descriptionRight: CustomLabel!
    @IBOutlet weak var humdidityRight: CustomLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getWeather()
    }
    
    func getWeather() {
        WheatherService.shared.getWeather { (success, weatherResult, iconURL)   in
            guard success else { return }
            guard let weatherResult = weatherResult else { return }
            guard let iconURLLeft = iconURL[0] else { return }
            guard let iconURLRigth = iconURL[1] else { return }
            self.getIcon(from: iconURLLeft, for: self.iconLeft)
            self.getIcon(from: iconURLRigth, for: self.iconRight)
            self.updateView(weatherResult: weatherResult)
        }
    }
    
    func getIcon(from url: URL, for imageView: UIImageView) {
        WheatherService.shared.getIcon(from: url) { (icon) in
            let icon = icon
            DispatchQueue.main.async {
                imageView.image = icon
            }
        }
    }
    
    func updateView(weatherResult: WeatherAPIResult) {
        
        let date = returnCurrentDate()
        
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        var cityLeft: String?
        var tempLeft: String?
        var humidityLeft: String?
        var descriptionLeft = "Description:"
        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        var cityRight: String?
        var tempRight: String?
        var humidityRight: String?
        var descriptionRight = "Description:"
        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        guard let weatherResult = weatherResult.list else { return }
        //::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        let resultLeft = weatherResult[0]
        // city name left
        if let resultCityLeft = resultLeft.name {
            cityLeft = resultCityLeft
        }
        // {main} left
        if let resultMainLeft = resultLeft.main {
            // temp left
            if let resultTempLeft = resultMainLeft.temp {
                let tempLeftInt = Int(resultTempLeft)
                tempLeft = String(tempLeftInt)
            }
            // humidity left
            if let resultHumidityLeft = resultMainLeft.humidity {
                humidityLeft = String(resultHumidityLeft)
            }
        }
        // Weather left
        if let resultWeather = resultLeft.weather {
            // weather Last left
            if let resultWeatherLast = resultWeather.last {
                // description left
                if let description = resultWeatherLast.description {
                    descriptionLeft = description
                }
            }
        }
        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        let resultRight = weatherResult[1]
        // city name right
        if let resultCityRight = resultRight.name {
            cityRight = resultCityRight
        }
        // {main} right
        if let resultMainRight = resultRight.main {
            // temp right
            if let resultTempRight = resultMainRight.temp {
                let tempRightInt = Int(resultTempRight)
                tempRight = String(tempRightInt)
            }
            // humidity right
            if let resultHumidityRight = resultMainRight.humidity {
                humidityRight = String(resultHumidityRight)
            }
        }
        // Weather right
        if let resultWeatherRight = resultRight.weather {
            // weather Last right
            if let resultWeatherRightLast = resultWeatherRight.last {
                // description right
                if let descriptionRightUnwrapped = resultWeatherRightLast.description {
                    descriptionRight = descriptionRightUnwrapped
                }
            }
        }
        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        
        DispatchQueue.main.async {
            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            self.cityLeft.text = cityLeft
            self.dateLeft.text = date
            self.descriptionLeft.text = descriptionLeft.capitalized
            if let tempLeft = tempLeft {
                self.currentTempLeft.text = "\(tempLeft)°"
            }
            if let humidityLeft = humidityLeft {
                self.humidityLeft.text = "Humidité: \(humidityLeft)%"
            }
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            //RIGHT
            self.cityRight.text = cityRight
            self.dateRight.text = date
            self.descriptionRight.text = descriptionRight.capitalized
            if let tempRight = tempRight {
                self.currentTempRight.text = "\(tempRight)°"
            }
            if let humidityRight = humidityRight {
                self.humdidityRight.text = "Humidité: \(humidityRight)%"
            }
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
}
