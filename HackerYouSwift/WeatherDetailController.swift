//
//  WeatherDetailController.swift
//  HackerYouSwift
//
//  Created by Tom Wark on 2016-04-15.
//  Copyright © 2016 Tom Wark. All rights reserved.
//

import UIKit

class WeatherDetailController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var city: String!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        WeatherService.sharedInstance.fetchWeatherForCity(city, completion: {
            weather in
            
            if let weather = weather {
                
                self.cityLabel.text = weather.city
                self.lowTempLabel.text = "\(weather.minTemp) °C"
                self.highTempLabel.text = "\(weather.maxTemp) °C"
                self.currentTempLabel.text = "\(weather.currentTemp) °C"
                self.descriptionLabel.text = "\(weather.description)"
            }
            else {
                print("Error getting city data")
            }
        })
    }
    
}
