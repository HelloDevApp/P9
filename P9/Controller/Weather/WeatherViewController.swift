//
//  WeatherViewController.swift
//  P9
//
//  Created by Mac Book Pro on 28/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var refreshButton: UIButton!
    
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

    let weatherService = WeatherService()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getWeather()
    }
    
    @IBAction func refreshButtonAction() {
        getWeather()
        disabledButtonWhileTwoMinutes(button: refreshButton)
    }
    
    func disabledButtonWhileTwoMinutes(button: UIButton) {
        
        button.isUserInteractionEnabled = false
        
        Timer.scheduledTimer(withTimeInterval: 30, repeats: false, block: { _ in
            button.isUserInteractionEnabled = true
        })
    }
    
    func getWeather() {
        
        weatherService.getWeather { (success, weatherResult, iconURL)   in
            
            guard success else {
                self.alert(message: ErrorMessages.noSuccess.rawValue, title: ErrorMessages.oupps.rawValue)
                return
            }
            
            guard let weatherResult = weatherResult else {
                self.alert(message: ErrorMessages.noResult.rawValue, title: ErrorMessages.oupps.rawValue)
                return
            }
            
            // update of view elements except icons
            self.updateView(weatherResult: weatherResult)
            
            guard let iconURLLeft = iconURL?[0], let iconURLRigth = iconURL?[1] else {
                self.alert(message: ErrorMessages.noIcon.rawValue, title: ErrorMessages.oupps.rawValue)
                return
            }
            
            // update of icons in the view
            self.getIcon(from: iconURLLeft, for: self.iconLeft)
            self.getIcon(from: iconURLRigth, for: self.iconRight)
        }
    }
    
    func getIcon(from url: URL, for imageView: UIImageView) {
        weatherService.getIcon(from: url) { (icon) in
            if let icon = icon {
                guard let icon = UIImage(data: icon) else {
                    return
                }
                imageView.image = icon
            } else {
                self.alert(message: ErrorMessages.noIcon.rawValue, title: ErrorMessages.oupps.rawValue)
            }
        }
    }
    
    func updateView(weatherResult: WeatherAPIResult) {
        
        // retrieve the current date
        updateDate()
        
        guard let weatherResult = weatherResult.list else {
            alert(message: ErrorMessages.noResult.rawValue, title: ErrorMessages.oupps.rawValue)
            return
        }
        // 'Paris' result
        let resultLeft = weatherResult[0]
        updateCity(result: resultLeft, leftOrRight: cityLeft)
        updateTemp(result: resultLeft, labelTemp: currentTempLeft)
        updateHumidity(result: resultLeft, labelHumidity: humidityLeft)
        updateDescription(result: resultLeft, descriptionLabel: descriptionLeft)
        
        // 'New York' result
        let resultRight = weatherResult[1]
        updateCity(result: resultRight, leftOrRight: cityRight)
        updateTemp(result: resultRight, labelTemp: currentTempRight)
        updateHumidity(result: resultRight, labelHumidity: humdidityRight)
        updateDescription(result: resultRight, descriptionLabel: descriptionRight)
    }
}
