//
//  WeatherViewController.swift
//  P9
//
//  Created by Mac Book Pro on 28/01/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityLeft: CustomLabel!
    @IBOutlet weak var dateLeft: UILabel!
    @IBOutlet weak var iconLeft: UIImageView!
    @IBOutlet weak var currentTempLeft: UILabel!
    @IBOutlet weak var descriptionLeft: CustomLabel!
    @IBOutlet weak var humidityLeft: CustomLabel!
    @IBOutlet weak var cityRight: CustomLabel!
    @IBOutlet weak var dateRight: UILabel!
    @IBOutlet weak var iconRight: UIImageView!
    @IBOutlet weak var currentTempRight: UILabel!
    @IBOutlet weak var descriptionRight: CustomLabel!
    @IBOutlet weak var humdidityRight: CustomLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
