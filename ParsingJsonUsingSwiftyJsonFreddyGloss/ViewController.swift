//
//  ViewController.swift
//  ParsingJsonUsingSwiftyJsonFreddyGloss
//
//  Created by Chaudhary Himanshu Raj on 23/01/18.
//  Copyright © 2018 Chaudhary Himanshu Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    
    //MARK: Overridden Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Required Functions
    func updateUI(name : String, address : String, company : String) {
        self.nameLbl.text = name
        self.addressLbl.text = address
        self.companyLbl.text = company
    }
    
    //MARK: Button Tap Actions
    @IBAction func swiftyButtonTapped(_ sender: Any) {
        ApiManager.shared.getUserInfo() { data in
                guard let swifty = SwiftyPerson(data: data) else { return }
                self.updateUI(name: swifty.name, address: swifty.address , company: swifty.company)
        }
    }
    
    @IBAction func FreddyButtonTapped(_ sender: Any) {
        ApiManager.shared.getUserInfo() { data in
            guard let freddy = FreddyPerson(data: data) else { return }
            self.updateUI(name: freddy.name, address: freddy.address , company: freddy.company)
        }
    }
    @IBAction func GlossButtonTapped(_ sender: Any) {
        ApiManager.shared.getUserInfo() { data in
            guard let gloss = GlossPerson(data: data) else { return }
            self.updateUI(name: gloss.name, address: gloss.address, company: gloss.company)
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
       updateUI(name: "", address: "", company: "")
    }

}

