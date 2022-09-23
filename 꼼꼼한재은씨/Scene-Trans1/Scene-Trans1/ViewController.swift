//
//  ViewController.swift
//  Scene-Trans1
//
//  Created by ohhyeongseok on 2022/01/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func moveNext(_ sender: Any) {
        if let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC"){
            uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            
            self.present(uvc, animated:  true)
        }
        
    }
    
}

