//
//  Weather.swift
//  WeatherApp
//
//  Created by Daniel Dume on 09/03/16.
//  Copyright © 2016 David Dume. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    
    var forweathers : [forweather] = []
    
    private var _url: String!
    private var updateurl :String!
    private var forcasturl :String!
    
    private var _cityName: String!
    private var _country: String!
    private var _forcountry: String!
    private var _weather: String!
    private var _iconForImage: String!
    private var _temperature: Double!
    private var _day: String!
    private var _date: String!
    private var _sunset: String!
    private var _sunrise: String!
    private var _humidity: Int!
    private var _wind: Double!
    private var _forday: String!
    private var _fordate: String!
    private var _fortemp: Double!
    private var _foricon: String!
    private var _fortime: String!
    private var _forweather:String!
    
    var sunset: String{
        if _sunset == nil {
            return ""
        }
        
        return _sunset
    }
    
    var sunrise: String {
        if _sunrise == nil {
            return ""
        }
        
        return _sunrise
    }
    
    var humidity: Int {
        if _humidity == nil {
            return 0
        }
        
        return _humidity
    }
    
    var wind: Double {
        if _wind == nil {
            return 0.0
        }
        
        return _wind
    }
    
    var cityName: String {
        if _cityName == nil {
            return ""
        }
        
        return _cityName
    }
    
    var country: String {
        if _country == nil {
            return ""
        }
        
        return _country
    }
    var forcountry :String{
        if _forcountry == nil{
        return ""
        }
        return _forcountry
    }
    
    var weather: String {
        if _weather == nil {
            return ""
        }
        
        return _weather
    }
    
    var icon: String {
        if _iconForImage == nil {
            return ""
        }
        
        return _iconForImage
    }
    
    var temperature: Double {
        if _temperature == nil {
            return 0
        }
        
        return _temperature
    }
    
    
    var day: String {
        if _day == nil {
            return ""
        }
        
        return _day
    }
    
    var date: String {
        if _date == nil {
            return ""
        }
        
        return _date
    }
    
    var forday: String {
        if _forday == nil {
            return ""
        }
        
        return _forday
    }
    
    var fordate: String{
            if _fordate == nil {
                return ""
            }
            return _fordate
    }

    var fortemp: Double{
        if _fortime == nil {
            return 0.0
        }
        return _fortemp
    }
    var foricon: String{
        if _foricon == nil {
            return ""
        }
        return _foricon
    }
    var fortime: String{
        if _fortime == nil {
            return ""
        }
        return _fortime
    }

    
    init(name: String ) {
        //print(name)
        self._cityName = name
        self._url = "\(MAIN_URL)\(CITY_URL)\(self._cityName)\(API_KEY)"
    }
    
    func downloadJSON(complete: DownloadCompleted) {
        
        //print(_cityName)(BD)
        updateurl = "\(MAIN_URL)\(CITY_URL)\(self._cityName)\(API_KEY)"
        
        let url = NSURL(string: self._url)!
        
        Alamofire.request(.GET, url).responseJSON{(response: Response<AnyObject, NSError>) -> Void in
            let result = response.result
            
                if let dict = result.value as? Dictionary<String, AnyObject> {
                 //print(dict)
                if let dt = dict["dt"] as? Double {
                    //print(dt)
                    let date = NSDate(timeIntervalSince1970: dt)
                    let dateFormatter = NSDateFormatter()
                    let dayFormatter = NSDateFormatter()
                    dayFormatter.dateFormat = "EEEE"
                    dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
                    self._day = dayFormatter.stringFromDate(date)
                    self._date = dateFormatter.stringFromDate(date)
                }
                
                    
                //print(self._day)
                //print(self._date)
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] where weather.count > 0 {
                    
                    if let main = weather[0]["main"] as? String {
                        self._weather = main
                    }
                    
                    if let icon = weather[0]["icon"] as? String {
                        self._iconForImage = icon
                    }
                    
                    //print(self._weather)
                    //print(self._iconForImage)
                    
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let temperature = main["temp"] as? Double {
                        self._temperature = temperature
                    }
                    
                    if let humidity = main["humidity"] as? Int {
                        self._humidity = humidity
                    }
                    
                    //print(self._temperature)
                    //print(self._humidity)
                    
                }
                
                if let wind = dict["wind"] as? Dictionary<String, Double> {
                    
                    if let speed = wind["speed"] {
                        self._wind = speed
                    }
                    
                    //print(self._wind)
                    
                }
                
                if let sys = dict["sys"] as? Dictionary<String, AnyObject> {
                    
                    if let country = sys["country"] as? String {
                        self._country = country
                    }
                    
                    if let sunrise = sys["sunrise"] as? Double {
                        let date = NSDate(timeIntervalSince1970: sunrise)
                        let sunriseFormatter = NSDateFormatter()
                        sunriseFormatter.dateFormat = "hh:mm a"
                        self._sunrise = sunriseFormatter.stringFromDate(date)
                    }
                    
                    if let sunset = sys["sunset"] as? Double {
                        let date = NSDate(timeIntervalSince1970: sunset)
                        let sunsetFormatter = NSDateFormatter()
                        sunsetFormatter.dateFormat = "hh:mm a"
                        self._sunset = sunsetFormatter.stringFromDate(date)
                    }
                    
                    //print(self._sunrise)
                    print(self._sunset)
                }
                
            }
            complete()
        }
        
    }
    
    func forcastJSON(complete: DownloadCompleted){
        
        //print(_cityName)(BD)
        updateurl = "\(FORCAST_URL)\(CITY_URL)\(self._cityName)\(API_KEY)"
        
        let url = NSURL(string: self.updateurl)!
        
        Alamofire.request(.GET, url).responseJSON{(response: Response<AnyObject, NSError>) -> Void in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
             //print(dict)
                
                
                for var index = 0; index <= 20 ;index++ {
                /////日期
                if let listdt = dict["list"] as? [Dictionary<String,AnyObject> ] where listdt.count > 0{
                    //for var index = 0; index <= 8 ;index++ {
                    if let dt = listdt[index]["dt"] as? Double{  ///////未来时间日期
                        let date = NSDate(timeIntervalSince1970: dt)
                        let dateFormatter = NSDateFormatter()
                        let dayFormatter = NSDateFormatter()
                        dayFormatter.dateFormat = "EEEE"
                        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
                        let fortimeFormatter = NSDateFormatter()
                        fortimeFormatter.dateFormat = "hh:mm a"
                        
                        self._forday = dayFormatter.stringFromDate(date)
                        self._fordate = dateFormatter.stringFromDate(date)
                        self._fortime = fortimeFormatter.stringFromDate(date)
                        
                        //print(self._forday,self._fordate,self._fortime)
                        
                    }
                    }
                ///////温度
                if let listdt = dict["list"] as? [Dictionary<String,AnyObject> ]where listdt.count > 0{
                    //for var index = 0; index <= 8 ;index++ {
                    if let main = listdt[index]["main"] {
                        //print(main)
                    if let temp = main["temp"] as? Double{
                        self._fortemp = temp
                        }
                   //print(self._fortemp)
                    }
                }
                
                
                
                ///////图标
                if let listdt = dict["list"] as? [Dictionary<String,AnyObject> ]where listdt.count > 0{
                    if let weather = listdt[index]["weather"] {
                        //print(main)
                        if let forweather = weather [0]["main"] as? String{
                            self._forweather = forweather
                        }
                        if let foricon = weather[0]["icon"] as? String{
                            self._foricon = foricon
                        }
                        //print(self._foricon)
                    }
                }
                
                    let Forweather = forweather(foricon: self.foricon, fordate: self.fordate, fortemp: self.fortemp, fortime: self.fortime)
                    //print(self.fordate,self.forday,self.fortime,self.foricon)
                    self.forweathers.append(Forweather)
                    
            }
                
///////////////////////buyaodong
}
            complete()
            
            
}
}
    

   }

