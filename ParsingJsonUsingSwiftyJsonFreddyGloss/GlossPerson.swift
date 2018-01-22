//
//  GlossPerson.swift
//  ParsingJsonUsingSwiftyJsonFreddyGloss
//
//  Created by Chaudhary Himanshu Raj on 23/01/18.
//  Copyright © 2018 Chaudhary Himanshu Raj. All rights reserved.
//

import Foundation
import Gloss

struct GlossPerson {
    let name : String
    let address : String
    let company : String
    
    init?(data : Data) {
        
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
        let user = json[2]
        
        self.name = "name" <~~ user ?? "NAME ERROR"
        let lat = "address.geo.lat" <~~ user ?? "LAT ERROR"
        let long = "address.geo.lng" <~~ user ?? "LONG ERROR"
        self.address = "Lat: \(lat) Long: \(long)"
        let company = "company.name" <~~ user ?? "COMPANY ERROR"
        self.company = company
    }
}
