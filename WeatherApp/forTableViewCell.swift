//
//  forTableViewCell.swift
//  WeatherApp
//
//  Created by liangwx on 16/6/29.
//  Copyright © 2016年 David Dume. All rights reserved.
//

import UIKit

class forTableViewCell: UITableViewCell {

    
    @IBOutlet weak var foricon: UIImageView!
    
    @IBOutlet weak var fordate: UILabel!
    
    @IBOutlet weak var fortemp: UILabel!
    
    @IBOutlet weak var fortime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
