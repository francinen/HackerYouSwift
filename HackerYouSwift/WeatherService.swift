//
//  WeatherService.swift
//  HackerYouSwift
//
//  Created by Tom Wark on 2016-04-15.
//  Copyright © 2016 Tom Wark. All rights reserved.
//

import Alamofire

class WeatherService {
    
    static let sharedInstance = WeatherService()
    
    let ApiKey = "0c39f4269454ad6bfacb57342c7baf98"
    
    func fetchWeatherForToronto() {
        
        Alamofire.request(.GET, "http://api.openweathermap.org/data/2.5/weather?q=Toronto&units=metric&appid=0c39f4269454ad6bfacb57342c7baf98")
            .responseJSON(completionHandler: {
                response in
                
                print(response.result.value)
            })
    }
    
    func fetchWeatherForCity(city: String, completion: (weather: Weather?) -> Void) {
        
        let params = [
            "units": "metric",
            "appid": ApiKey,
            "q": city
        ]
        
        Alamofire.request(.GET, "http://api.openweathermap.org/data/2.5/weather", parameters: params, encoding: .URLEncodedInURL, headers: nil)
            .responseJSON(completionHandler: {
                response in
                
                print(response.result.value)
                
                guard let json = response.result.value as? [String: AnyObject] else {
                    completion(weather: nil)
                    return
                }
                
                guard let main = json["main"] as? [String: AnyObject] else {
                    completion(weather: nil)
                    return
                }
                guard let weatherData = json["weather"] as? [[String: AnyObject]] else {
                    completion(weather: nil)
                    return
                }
                
                let city = city
                let minTemp = main["temp_min"] as! Int
                let maxTemp = main["temp_max"] as! Int
                let currentTemp = main["temp"] as! Int
                let description = weatherData[0]["description"] as! String
                
                let weather = Weather(city: city, minTemp: minTemp, maxTemp: maxTemp, currentTemp: currentTemp, description: description)
                
                completion(weather: weather)
            })
    }
}
