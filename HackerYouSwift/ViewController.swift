//
//  ViewController.swift
//  HackerYouSwift
//
//  Created by Tom Wark on 2016-04-15.
//  Copyright © 2016 Tom Wark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    let randomWords = ["food", "Tom", "cat", "Swift"]
    var index = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        mainLabel.text = randomWords[index]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: UIButton) {
        
        if index == randomWords.count - 1 {
            index = 0
        }
        else {
            index += 1
        }
        mainLabel.text = randomWords[index]
    }
    
    @IBAction func fetchWeather(sender: AnyObject) {
        
//        WeatherService.sharedInstance.fetchWeatherForCity("Toronto", completion: {
//            weather in
//            
//            print(weather)
//        })
    }
}

