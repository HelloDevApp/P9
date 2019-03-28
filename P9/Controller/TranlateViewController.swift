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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        languageDestinationLabel.text = Languages.allCases[Languages.allCases.count/2].rawValue
    }
    
    @IBAction func buttonTranslateAction() {
        
        guard let textToTranslate =  textToTranslate.text else { return }
        guard textToTranslate.isEmpty == false, textToTranslate != "" else { return }
        guard textToTranslate != "Entrer du texte" else { return }
        TranslaterService.shared.textToTranslate = textToTranslate
        TranslaterService.shared.getTranslation { (success, translatedText) in
            guard success else { print("pas de success"); return }
            guard let translatedText = translatedText else { print("pas de reponse"); return }
            DispatchQueue.main.async {
            self.resultTextView.text = translatedText
            }
        }
    }
}
