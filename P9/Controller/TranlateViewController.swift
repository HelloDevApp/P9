//
//  TranlateViewController.swift
//  P9
//
//  Created by Mac Book Pro on 23/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class TranlateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Data.shared.enumCaseToArray(language: true, currency: nil)
    }
}

// MARK: Picker View
extension TranlateViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // number of pickerView components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // number of rows in the component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Data.shared.arrayLanguage.count
    }
    
    // title of the selected row
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        // we change the color of the pickerView text and assign it a text
        let attribute = NSAttributedString(string: Data.shared.arrayLanguage[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return attribute
    }
}
