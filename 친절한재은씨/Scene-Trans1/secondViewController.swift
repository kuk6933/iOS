//
//  secondViewController.swift
//  Scene-Trans1
//
//  Created by ohhyeongseok on 2022/01/26.
//

import Foundation
import UIKit

class secondViewController: UIViewController {

    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
