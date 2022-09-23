//
//  ViewController.swift
//  Scene-ManualSegue
//
//  Created by ohhyeongseok on 2022/02/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func wind(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    
    }
    
    
}

