//
//  SecondViewController.swift
//  Scene-Trans2
//
//  Created by ohhyeongseok on 2022/01/26.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
