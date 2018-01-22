//
//  SwiftyPerson.swift
//  ParsingJsonUsingSwiftyJsonFreddyGloss
//
//  Created by Chaudhary Himanshu Raj on 23/01/18.
//  Copyright © 2018 Chaudhary Himanshu Raj. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SwiftyPerson {
    let name : String
    let address : String
    let company : String
    
    init?(data : Data) {
        let json = JSON(data: data)
        
        guard let name = json[0]["name"].string,
            let lat = json[0]["address"]["geo"]["lat"].string,
            let long = json[0]["address"]["geo"]["lng"].string,
            let company = json[0]["company"]["name"].string
            else { return nil }
        
        self.name = name
        self.address = "Lat: \(lat) Long: \(long)"
        self.company = company
    }
}
