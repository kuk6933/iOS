//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by ohhyeongseok on 2022/02/07.
//

import Foundation
import UIKit

class NewSegue: UIStoryboardSegue {
    override func perform() {
        let srcUVC = self.source
        
        let destUVC = self.destination
        
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
    }
}
