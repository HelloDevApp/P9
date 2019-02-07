//
//  CurrencyViewController.swift
//  P9
//
//  Created by Mac Book Pro on 05/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // we fill the array with the different cases of enumeration
        Data.shared.enumCaseToArray(language: nil, currency: true)
    }

}

// MARK: Picker View
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
        let attribute = NSAttributedString(string:Data.shared.arrayCurrency[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return attribute
    }
}
