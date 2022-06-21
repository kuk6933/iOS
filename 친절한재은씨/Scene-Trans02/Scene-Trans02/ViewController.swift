//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by ohhyeongseok on 2022/01/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveByNavy(_ sender: Any) {
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
    
    self.navigationController?.pushViewController(uvc, animated: true)
    }
    
}

