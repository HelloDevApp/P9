//
//  WeatherViewController.swift
//  P9
//
//  Created by Mac Book Pro on 28/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // Left Outlets
    @IBOutlet weak var cityLeft: CustomLabel!
    @IBOutlet weak var dateLeft: UILabel!
    @IBOutlet weak var iconLeft: UIImageView!
    @IBOutlet weak var currentTempLeft: UILabel!
    @IBOutlet weak var descriptionLeft: CustomLabel!
    @IBOutlet weak var humidityLeft: CustomLabel!
    
    // Right Outlets
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
            guard success else {
                self.alert(message: ErrorMessages.noSuccess.rawValue, title: ErrorMessages.oupps.rawValue)
                return
            }
            guard let weatherResult = weatherResult else {
                self.alert(message: ErrorMessages.noResult.rawValue, title: ErrorMessages.oupps.rawValue)
                return
            }
            self.updateView(weatherResult: weatherResult)
            guard let iconURLLeft = iconURL?[0], let iconURLRigth = iconURL?[1] else {
                self.alert(message: ErrorMessages.noIcon.rawValue, title: ErrorMessages.oupps.rawValue)
                return
            }
            self.getIcon(from: iconURLLeft, for: self.iconLeft)
            self.getIcon(from: iconURLRigth, for: self.iconRight)
        }
    }
    
    func getIcon(from url: URL, for imageView: UIImageView) {
        WheatherService.shared.getIcon(from: url) { (icon) in
            if let icon = icon {
                guard let icon = UIImage(data: icon) else { return }
                imageView.image = icon
            } else {
                self.alert(message: ErrorMessages.noIcon.rawValue, title: ErrorMessages.oupps.rawValue)
            }
        }
    }
    
    func updateView(weatherResult: WeatherAPIResult) {
        
        updateDate()
        
        guard let weatherResult = weatherResult.list else {
            alert(message: ErrorMessages.noResult.rawValue, title: ErrorMessages.oupps.rawValue)
            return
        }
        let resultLeft = weatherResult[0]
        updateCity(result: resultLeft, leftOrRight: cityLeft)
        updateTemp(result: resultLeft, labelTemp: currentTempLeft)
        updateHumidity(result: resultLeft, labelHumidity: humidityLeft)
        updateDescription(result: resultLeft, descriptionLabel: descriptionLeft)
        
        let resultRight = weatherResult[1]
        updateCity(result: resultRight, leftOrRight: cityRight)
        updateTemp(result: resultRight, labelTemp: currentTempRight)
        updateHumidity(result: resultRight, labelHumidity: humdidityRight)
        updateDescription(result: resultRight, descriptionLabel: descriptionRight)
    }
}
