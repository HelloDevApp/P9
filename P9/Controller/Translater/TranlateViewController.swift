//
//  TranlateViewController.swift
//  P9
//
//  Created by Mac Book Pro on 23/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class TranlateViewController: UIViewController {

    @IBOutlet weak var pickerViewTargetLang: CustomPickerView!
    
    @IBOutlet weak var languageDestinationLabel: CustomLabel!
    
    @IBOutlet weak var textToTranslate: CustomTextView!
    
    @IBOutlet weak var resultTextView: CustomTextView!
    
    // contains the value of the case located in the middle of the language array.
    var languagesCountDivideByTwo = Languages.allCases[Languages.allCases.count/2].rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        languageDestinationLabel.text = languagesCountDivideByTwo
    }
    
    @IBAction func buttonTranslateAction() {
//        getTargetLang()
        guard let textToTranslate = textToTranslate.text else { print("no success1"); return }
        guard textToTranslate.isEmpty == false, textToTranslate != "" else { print("no success2"); return }
        guard textToTranslate != "Entrer du texte" else { print("no success3"); return }
        Translater.shared.textToTranslate = textToTranslate
        TranslaterService.shared.replaceMultipleCharactersForRequest()
        launchRequest()
    }
    
    func setup() {
        view.addGestureToHideKeyboard()
        SpecialCharactersSign.createDictionnaryOfSpecialCharactersSignAndCodes()
        Translater.shared.targetLang = "\(Languages.allCases[Languages.allCases.count/2])"
        print(Translater.shared.targetLang)
    }
    
    func launchRequest() {
        
        TranslaterService.shared.getTranslation { (success, translations) in
            
            guard success else { return }
            guard let translations = translations else { return }
            guard let translatedText = translations.translatedText else { return }
            let translatedTextFinal = TranslaterService.shared.replaceCharactersOfTranslatedText(translatedText: translatedText)
            
            DispatchQueue.main.async {
                self.resultTextView.text = translatedTextFinal
                print(translatedTextFinal)
            }
        }
    }
}


//    func getTargetLang() {
//        for nameCase in Languages.allCases {
//            if nameCase.rawValue == languageDestinationLabel.text {
//                print("\(nameCase)")
//            }
//        }
//    }
