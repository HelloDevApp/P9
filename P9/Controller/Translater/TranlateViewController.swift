//
//  TranlateViewController.swift
//  P9
//
//  Created by Mac Book Pro on 23/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class TranlateViewController: UIViewController {
    
    let translaterService = TranslaterService()

    @IBOutlet weak var pickerViewTargetLang: CustomPickerView!
    
    @IBOutlet weak var languageDestinationLabel: CustomLabel!
    
    @IBOutlet weak var textToTranslate: CustomTextView!
    
    @IBOutlet weak var resultTextView: CustomTextView!
    
    @IBOutlet weak var buttonTranslation: UIButton!
    
    // contains the value of the case located in the middle of the language array.
    var languagesCountDivideByTwo = Languages.allCases[Languages.allCases.count/2].rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        languageDestinationLabel.text = languagesCountDivideByTwo
    }
    
    @IBAction func buttonTranslateAction() {
        buttonTranslation.isEnabled = false
        // we check that the text is not nil.
        guard let textToTranslate = textToTranslate.text else {
            alert(message: ErrorMessages.isEmpty.rawValue, title: ErrorMessages.oupps.rawValue)
            return
        }
        // we check that the text is not empty
        guard textToTranslate.isEmpty == false, textToTranslate != Constants.stringEmpty else {
            alert(message: ErrorMessages.isEmpty.rawValue, title: ErrorMessages.oupps.rawValue)
            return
        }
        // we check that the text is different from the placeholder
        guard textToTranslate != Constants.placeholderTranslater else {
            alert(message: ErrorMessages.isEmpty.rawValue, title: ErrorMessages.oupps.rawValue)
            return
        }
        translaterService.textToTranslate = textToTranslate
        launchRequest()
    }
    
    func setup() {
        view.addGestureToHideKeyboard()
        translaterService.getTargetLang(forSetup: true, row: nil)
        print(translaterService.targetLang)
    }
    
    // allows you to launch the request
    func launchRequest() {
        
        translaterService.getTranslation { (success, translations) in
            // we check that the request has been successfully completed
            guard success else {
                self.alert(message: ErrorMessages.noSuccess.rawValue, title: ErrorMessages.oupps.rawValue)
                self.buttonTranslation.isEnabled = true
                return
            }
            
            // we check that we have the translation structure
            guard let translations = translations else {
                self.alert(message: ErrorMessages.noTranslations.rawValue, title: ErrorMessages.oupps.rawValue)
                return
            }
            self.updateView(translations: translations)
            
        }
    }
    
    func replaceCharactersOfTranslatedText(translatedText: String) -> String {
        var translatedText = translatedText
        let findValue = Constants.apostropheCode
        let replaceValue = Constants.apostrophe
        if translatedText.contains(findValue) {
            translatedText = translatedText.replacingOccurrences(of: findValue, with: replaceValue)
            return translatedText
        }
        return translatedText
    }
    
    func updateView(translations: Translation) {
        
        // we check that the structure contains a translation
        guard let translatedText = translations.translatedText else {
            self.alert(message: ErrorMessages.noTranslations.rawValue, title: ErrorMessages.oupps.rawValue)
            return
            
        }
        // the final text after replacing the special characters
        let translatedTextFinal = replaceCharactersOfTranslatedText(translatedText: translatedText)
        self.resultTextView.text = translatedTextFinal
        self.buttonTranslation.isEnabled = true
        print(translatedTextFinal)
    }
}
