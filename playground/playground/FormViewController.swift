//
//  FormViewController.swift
//  Playground
//
//  Created by ohhyeongseok on 2023/01/09.
//

import Foundation
import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var isUpdate: UISwitch!
    
    @IBOutlet var interval: UIStepper!
    
    @IBAction func onSubmit(_ sender: Any) {
        let ud = UserDefaults.standard
        
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn, forKey: "isUpdate")
        ud.set(self.interval.value, forKey: "interval")
        
        self.presentingViewController?.dismiss(animated:true)
    }
 
    
    
    
    
}
