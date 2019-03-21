//
//  ExtensionTranlateController.swift
//  P9
//
//  Created by Mac Book Pro on 14/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

// MARK: Text View Setting
extension TranlateViewController: UITextViewDelegate {
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Entrer du texte"
            self.view.hideKeyboard()
        }
    }
}

// MARK: Picker VIew Setting
extension TranlateViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // number of pickerView components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // number of rows in the component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Data.shared.arrayLanguages.count
    }
    
    // title of the selected row
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        // we change the color of the pickerView text and assign it a text
        let attribute = NSAttributedString(string: Data.shared.arrayLanguages[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return attribute
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        languageDestinationLabel.text = Data.shared.arrayLanguages[row]
    }
}
