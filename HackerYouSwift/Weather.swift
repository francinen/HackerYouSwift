//
//  Weather.swift
//  HackerYouSwift
//
//  Created by Tom Wark on 2016-04-15.
//  Copyright © 2016 Tom Wark. All rights reserved.
//

import Foundation

class Weather {
    
    let city: String
    let minTemp: Int
    let maxTemp: Int
    let currentTemp: Int
    let description: String
    
    init(city: String, minTemp: Int, maxTemp: Int, currentTemp: Int, description: String) {
        
        self.city = city
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.currentTemp = currentTemp
        self.description = description
    }
    
}