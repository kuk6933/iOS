//
//  ViewController.swift
//  Playground
//
//  Created by ohhyeongseok on 2023/01/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultEmail: UILabel!
    
    @IBOutlet var resultIsUpdate: UILabel!
    
    @IBOutlet var resultInterval: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        let ud = UserDefaults.standard
        
        if let email = ud.string(forKey: "email") {
            resultEmail.text = email
        }
        
        let update = ud.bool(forKey: "isUpdate")
        resultIsUpdate.text = (update == true ? "자동갱신" : "자동갱신안함")
        
        let interval = ud.double(forKey: "interval")
        resultInterval.text = "\(Int(interval))분마다"
            
    }
}

