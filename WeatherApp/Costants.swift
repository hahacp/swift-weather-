//
//  Costants.swift
//  WeatherApp
//
//  Created by Daniel Dume on 09/03/16.
//  Copyright © 2016 David Dume. All rights reserved.
//

import Foundation

let MAIN_URL = "http://api.openweathermap.org/data/2.5/weather?"
let FORCAST_URL = "http://api.openweathermap.org/data/2.5/forecast?"
let CITY_URL = "q="
let API_KEY = "&units=metric&APPID=85a918d6d9beeb39d13475f2feb7a219"

typealias DownloadCompleted = () -> ()