//
//  Freddyperson.swift
//  ParsingJsonUsingSwiftyJsonFreddyGloss
//
//  Created by Chaudhary Himanshu Raj on 23/01/18.
//  Copyright © 2018 Chaudhary Himanshu Raj. All rights reserved.
//

import Foundation
import Freddy

struct FreddyPerson {
    let name : String
    let address : String
    let company : String
    
    init?(data : Data) {
        do {
            let json = try JSON(data: data)
            let name = try json.getString(at: 1, "name")
            let lat = try json.getString(at: 1, "address", "geo", "lat")
            let long = try json.getString(at: 1, "address", "geo", "lng")
            let company = try json.getString(at: 1, "company", "name")
            
            self.name = name
            self.address = "Lat: \(lat) Long: \(long)"
            self.company = company
        } catch {
            print(error)
            return nil
        }
    }
}
