//
//  forweather.swift
//  WeatherApp
//
//  Created by liangwx on 16/6/29.
//  Copyright © 2016年 David Dume. All rights reserved.
//

import Foundation
class forweather {
    var foricon : String = ""
    var fordate : String = ""
    var fortemp : double_t = 0.0
    var fortime : String = ""
    
    
    init(foricon:String,fordate:String,fortemp :Double,fortime:String){
    self.foricon = foricon
    self.fordate = fordate
    self.fortemp = fortemp
    self.fortime = fortime
    }
}