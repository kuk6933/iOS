//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by ohhyeongseok on 2022/02/08.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet var resultEmail: UILabel!
    
    
    @IBOutlet var resultUpdate: UILabel!
    

    @IBOutlet var resultInterval: UILabel!
    
    
            

    override func viewWillAppear(_ animated: Bool) {
        
        let ud = UserDefaults.standard
        
        if let email = ud.string(forKey: "email") {
            resultEmail.text = email
        }
        
        let update = ud.bool(forKey: "isUpdate")
        resultUpdate.text = (update == true ? "자동갱신" : "자동갱신안함")
        
        let interval = ud.double(forKey: "interval")
        resultInterval.text = "\(Int(interval))분마다"
            
    }
  
        
}

