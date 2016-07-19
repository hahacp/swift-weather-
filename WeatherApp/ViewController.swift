//
//  ViewController.swift
//  WeatherApp
//
//  Created by Daniel Dume on 07/03/16.
//  Copyright © 2016 David Dume. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var weather: Weather!
    
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var cityLBL: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var dayLBL: UILabel!
    @IBOutlet weak var dateLBL: UILabel!
    @IBOutlet weak var temperatureLBL: UILabel!
    @IBOutlet weak var sunsetLbl: UILabel!
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var humidityLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weather = Weather(name: "baoding")
        searchBar.delegate = self
        
        setUI()
        
    }
    
    
        func setUI() {
        //weather = Weather(name: "baoding")
        weather.downloadJSON { () -> () in
            self.countryLbl.text = self.weather.country
            self.cityLBL.text = self.weather.cityName
            self.dayLBL.text = self.weather.day
            self.dateLBL.text = self.weather.date
            self.temperatureLBL.text = "\(self.weather.temperature)"
            self.sunriseLbl.text = self.weather.sunrise
            self.sunsetLbl.text = self.weather.sunset
            self.windLbl.text = "\(self.weather.wind) m/s"
            self.humidityLBL.text = "\(self.weather.humidity) %"
            self.weatherImg.image = UIImage(named: "\(self.weather.icon)")
        }
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let searchedCity = searchBar.text!.stringByReplacingOccurrencesOfString(" ", withString: "")
        weather = Weather(name: searchedCity)
        print(weather.cityName)
        setUI()
        view.endEditing(true)
    }
    
    
}

