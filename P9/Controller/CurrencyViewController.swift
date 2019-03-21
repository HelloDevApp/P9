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
    @IBOutlet weak var CurrentMoneyTextField: CustomTextField!
    // label that contains the chosen currency
    @IBOutlet weak var currencyLabelDestination: CustomLabel!
    // the textField used to display the result of the conversion
    @IBOutlet weak var resultTextField: CustomTextField!
    
    // boolean variable that allows to determine if the request has been launched
    private var _requestIsLaunch = false
    // a variable of the Rates type which will be a mirror containing the values of each rate received by the API
    private var _mirorStructRates: Rates?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // 
    @IBAction func actionValidateButton(_ sender: Any) {
        launchRequest()
    }
    
    private func launchRequest() {
        // we unwrap and assign the value of the current currency in the label to a constant
        guard let currentCurrency = self.currencyLabelDestination.text else { return }
        // we check that the textField contains a value
        guard let money = self.CurrentMoneyTextField.text else { return }
        // we check that this value can be converted type Double
        guard let moneyDouble = Double(money) else { return }
        
        // this code block is executed after the first conversion and allows to economise the number of requests launched
        guard _requestIsLaunch == false else {
            // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            // the values of each contained rate of _mirorStructRates are copied into a new instance
            guard let mirorStructRates = _mirorStructRates else { return }
            affectValueRateAndNameCurrency(currentCurrencyName: currentCurrency, reflect: mirorStructRates)
            // start the conversion and enjoy the display of the result
            _launchConvert(moneyDouble: moneyDouble)
            return
            // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        }
        
        // this code block is executed only one time until the application is closed
        ConverterService.shared.getRates { (success, rates)  in
            // we check that the request has been processed correctly
            guard success else { return }
            // we check that the unwrapping of the rates is done correctly
            guard let rates = rates else { return }
            // the rates values are assigned to the mirorStructRates
            self._mirorStructRates = rates
            // a name and a rate are assigned to rateValueDestination(nameCurrency: String, rate: Double?) depending on the currency chosen
            self.affectValueRateAndNameCurrency(currentCurrencyName: currentCurrency, reflect: rates)
            // we come back in the main queue
            DispatchQueue.main.async {
                self._launchConvert(moneyDouble: moneyDouble)
            }
            // we pass the value to true while the application is open
            self._requestIsLaunch = true
        }
    }
    // allows you to launch a conversion and update the text with the result of the conversion
    private func _launchConvert(moneyDouble: Double) {
        // performs the conversion and returns the result
        let result = ConverterCurrency.shared.convert(moneyToConvert: moneyDouble)
        // update of the display
        self.updateTextFieldWithResult(result: result)
    }
    // allows you to change the text of the textField to display the result
    private func updateTextFieldWithResult(result: Double) {
        resultTextField.text = "\(result)"
    }
}
