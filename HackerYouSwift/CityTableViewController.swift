//
//  CityTableViewController.swift
//  HackerYouSwift
//
//  Created by Tom Wark on 2016-04-15.
//  Copyright © 2016 Tom Wark. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    let cities = ["Toronto", "Montreal", "Yellowknife", "Miami"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cities.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("defaultCell", forIndexPath: indexPath)

        cell.textLabel?.text = cities[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedCity = cities[indexPath.row]
        
        let cityDetailController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewControllerWithIdentifier("cityDetail") as! WeatherDetailController
        
        cityDetailController.city = selectedCity
        
        navigationController?.pushViewController(cityDetailController, animated: true)
    }
}
