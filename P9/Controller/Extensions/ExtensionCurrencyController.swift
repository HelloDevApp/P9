//
//  ExtensionCurrencyController.swift
//  P9
//
//  Created by Mac Book Pro on 14/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation
import UIKit

// MARK: Text View Setting
extension CurrencyViewController: UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = ""
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard textField.text != nil else { return }
        
        if textField.text!.isEmpty {
            textField.attributedPlaceholder = NSAttributedString(string: "Entrez une valeur", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
            self.view.hideKeyboard()
        }
    }
}

extension CurrencyViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // number of pickerView components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // number of rows in the component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Data.shared.arrayCurrency.count
    }
    
    // title of the selected row
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        // we change the color of the pickerView text and assign it a text
        let attribute = NSAttributedString(string: Data.shared.arrayCurrency[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return attribute
    }
}
