//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate{

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self //Self refer to current viewcontroller
        weatherManager.delegate = self
    }


    @IBAction func searchPressed(_ sender: UIButton) {
        view.endEditing(true) //dismiss keyboard
    }
    
    //keyboard return triggered
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        weatherManager.fetchWeather(cityName: searchTextField.text!)
        view.endEditing(true) //dismiss keyboard
        return true
    }
    
    //Dismiss keyboard condition
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //dismiss if no input
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Search"
            return false
        }
    }
    
    //Clear textfield when done typing
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
    
    func updateWeather(weather: WeatherModel) {
        //update current weather
    }
}

