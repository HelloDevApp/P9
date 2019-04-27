//
//  ExtensionCurrencyController.swift
//  P9
//
//  Created by Mac Book Pro on 14/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit
//==================================================
// MARK:-----------Text Field Settings--------------
//==================================================
extension CurrencyViewController: UITextFieldDelegate {
    
    // called when the user has started editing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = Constants.stringEmpty
        textField.text = Constants.stringEmpty
    }
    
    // called when the user has finished editing
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // if the textfield.text is different to nil, we create a constant that contains the value of the textfield
        guard let textFieldText = textField.text else { return }
        
        // we check that the text is empty
        guard textFieldText.isEmpty else { return }
        
        textField.attributedPlaceholder = NSAttributedString(string: Constants.placeholderConverter, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    // method called each time the user adds a character: allows to check if a dot can be added
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // we create a constant equal to the text of the textfield if possible
        guard let textFieldtext = textField.text else { return false }
        
        // we check that the total number of characters is smaller than 13
        guard textFieldtext.count < 13 else {
            alert(message: ErrorMessages.ValueTooLong.rawValue, title: ErrorMessages.oupps.rawValue)
            return false
        }
        
        // we check that the character is a point
        guard string == Constants.point else {
            return true
        }
        
        // we check that the number does not contain a point
        guard !textFieldtext.contains(Constants.point) else {
            alert(message: ErrorMessages.pointAlreadyExists.rawValue, title: ErrorMessages.oupps.rawValue)
            return false
        }
        
        // we check that the total number of characters is not empty
        guard textFieldtext.count != 0 else {
            alert(message: ErrorMessages.startWithPoint.rawValue, title: ErrorMessages.oupps.rawValue)
            return false
            
        }
        return true
    }
}
//==================================================
//MARK:-------------Picker View Settings------------
//==================================================
extension CurrencyViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    override func viewDidAppear(_ animated: Bool) {
        pickerView.selectRow(CurrenciesNames.allCases.count / 2, inComponent: 0, animated: false)
    }
    
    // number of pickerView components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // number of rows in the component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CurrenciesNames.allCases.count
    }
    
    // title of the selected row
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        // we change the color of the pickerView text and assign it a text
        let attribute = NSAttributedString(string: String("\(CurrenciesNames.allCases[row])").uppercased(), attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return attribute
    }
        
    // we update the text of the label each time the selected value of the pickerView changes
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currentCurrency = String("\(CurrenciesNames.allCases[row])").uppercased()
        currencyLabelDestination.text = currentCurrency
    }
}
    
//==================================================
// MARK: -----------General Setting Method----------
//==================================================
extension CurrencyViewController {
        
    // method that configures some details
    func setup() {
            
        // initialization of the gesture
        view.addGestureToHideKeyboard()
        
        // we add the text that corresponding to position of pickerView
        currencyLabelDestination.text = String("\(CurrenciesNames.allCases[CurrenciesNames.allCases.count/2])").uppercased()
    }
        
    // add a value rate and names currency in rateValueDestination property
    func affectValueRateAndNameCurrency(currentCurrencyName: String, reflect: Rates) {
        // we create a mirror that reflects all the properties of the Rates structure
        // (allows to make comparisons with the name of a variable for example: if mirror.label == currentNameCurrency)
        let mirrorRates = Mirror(reflecting: reflect)
        // we scan the values in the array to find a match with the selected currency
        for rate in mirrorRates.children {
            // rate.label contains the short name of the currency
            if currentCurrencyName == rate.label {
                for currencyName in CurrenciesNames.allCases {
                    if currentCurrencyName == "\(currencyName)".uppercased() {
                        guard let rateDouble = rate.value as? Double else { return }
                        converter.changeValueOfRateDestination(rate: rateDouble)
                    }
                }
            }
        }
    }
}
