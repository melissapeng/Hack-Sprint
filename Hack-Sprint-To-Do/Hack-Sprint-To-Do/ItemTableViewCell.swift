//
//  ItemTableViewCell.swift
//  Hack-Sprint-To-Do
//
//  Created by Michael Yu on 5/26/17.
//  Copyright © 2017 Michael Yu. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    

    
    func styles(index: Int){
        
        let customPink = hexStringToUIColor(hex: "#de3293")
        let customBlue = hexStringToUIColor(hex: "#46b7dc")

        timeLabel.layer.borderWidth = 2.00
        timeLabel.font = UIFont(name: "DIN Light", size: 18)
        itemLabel.font = UIFont(name: "DIN Light", size: 22)

        timeLabel.layer.cornerRadius = 20
        
        //set alternating colors
        if(index%2 == 0){
            timeLabel.layer.borderColor = customPink.cgColor
        }else{
            timeLabel.layer.borderColor = customBlue.cgColor

        }
        
    }

    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}

