//
//  ExtensionTranlateController.swift
//  P9
//
//  Created by Mac Book Pro on 14/02/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

//============================================
// MARK:---------Text View Settings-----------
//============================================
extension TranlateViewController: UITextViewDelegate {
    
    // this method is called every time the user starts writing 
    public func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    // this method is called each time the user has finished writing
    public func textViewDidEndEditing(_ textView: UITextView) {
        // if the text is empty, a placeholder is assigned
        if textView.text.isEmpty {
            textView.text = "Entrer du texte"
            self.view.hideKeyboard()
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if textView == textToTranslate {
            let allowedCharacters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ,.:=()[]?!@+-/’#Çç'"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: text)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            if textView.text.first != "^" && textView.text.first != "`" && textView.text.first != "'" {
                return alphabet
            }
        }
        return false
    }
}

//============================================
// MARK:---------Picker View Settings---------
//============================================
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
    
    // we update the text of the label each time the selected value of the pickerView changes
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currentLanguage = Data.shared.arrayLanguages[row]
        languageDestinationLabel.text = currentLanguage
    }
}
