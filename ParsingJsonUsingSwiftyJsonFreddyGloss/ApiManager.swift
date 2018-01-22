//
//  ApiManager.swift
//  ParsingJsonUsingSwiftyJsonFreddyGloss
//
//  Created by Chaudhary Himanshu Raj on 23/01/18.
//  Copyright © 2018 Chaudhary Himanshu Raj. All rights reserved.
//

import Foundation

class ApiManager {
    
    static let shared = ApiManager()
    private init() {}
    
    func getUserInfo(completion: (Data) -> Void) {
        guard let path = Bundle.main.path(forResource: "UserDetails", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        let data = try! Data(contentsOf: url)
        completion(data)
    }
}
