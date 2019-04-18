//
//  CurrencyViewController.swift
//  P9
//
//  Created by Mac Book Pro on 05/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    // the pickerView of the converter part
    @IBOutlet weak var pickerView: CustomPickerView!
    // the textfield which contains the amount to be converted
    @IBOutlet weak var currentMoneyTextField: CustomTextField!
    // label that contains the chosen currency
    @IBOutlet weak var currencyLabelDestination: CustomLabel!
    // the textField used to display the result of the conversion
    @IBOutlet weak var resultTextField: CustomTextField!
    
    var moneyDouble = 0.0
    
    // boolean variable that allows to determine if the request has been launched
    private var _requestIsLaunch = false
    
    // a variable of the Rates type which will be a mirror containing the values of each rate received by the API
    private var _mirorStructRates: Rates?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // the action related to the button
    @IBAction func actionValidateButton(_ sender: Any) {
        
        launchRequest()
    }
    
    private func launchRequest() {
        
        guard let currentCurrency = self.currencyLabelDestination.text else { return }
        
        guard let money = self.currentMoneyTextField.text else { return }
        
        let isConvertible = convertStringToDouble(number: money)
        
        guard isConvertible else { return }
        
        guard _requestIsLaunch == false else {
            // the values of each contained rate of _mirorStructRates are copied into a new instance
            guard let mirorStructRates = _mirorStructRates else { return }
            affectValueRateAndNameCurrency(currentCurrencyName: currentCurrency, reflect: mirorStructRates)
            // start the conversion and enjoy the display of the result
            _launchConvert(moneyDouble: moneyDouble)
            return
        }
        
        // this code block is executed only one time until the application is closed
        ConverterService.shared.getRates { (success, rates)  in
            
            guard success else {
                self.alert(message: ErrorMessages.noSuccess.rawValue, title: ErrorMessages.oupps.rawValue)
                return
            }
            
            guard let rates = rates else {
                self.alert(message: ErrorMessages.noRates.rawValue, title: ErrorMessages.oupps.rawValue)
                return
            }
            
            // the rates values are assigned to the mirorStructRates
            self._mirorStructRates = rates
            
            // a name and a rate are assigned to rateValueDestination(nameCurrency: String, rate: Double?) depending on the currency chosen
            self.affectValueRateAndNameCurrency(currentCurrencyName: currentCurrency, reflect: rates)
            
            self._launchConvert(moneyDouble: self.moneyDouble)
            
            // we pass the value to true while the application is open
            self._requestIsLaunch = true
        }
    }
    
    // allows you to launch a conversion and update the text with the result of the conversion
    private func _launchConvert(moneyDouble: Double) {
        
        let result = Converter.shared.convert(moneyToConvert: moneyDouble)
        self.updateTextFieldWithResult(result: result)
    }
    
    // allows you to change the text of the textField to display the result
    private func updateTextFieldWithResult(result: Double) {
        if result < 0 { print("erreur"); return }
        resultTextField.text = "\(result)"
    }
    
    // allows to convert the parameter number to a decimal number if possible
    func convertStringToDouble(number: String) -> Bool {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale.current
        
        // we check that number is convertible
        guard let numberFormatted = numberFormatter.number(from: number) else {
            alert(message: ErrorMessages.isEmpty.rawValue, title: ErrorMessages.oupps.rawValue)
            return false
        }
        moneyDouble = numberFormatted.doubleValue
        return true
    }
}
