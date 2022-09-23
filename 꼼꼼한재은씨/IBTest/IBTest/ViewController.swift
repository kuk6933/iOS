//
//  ViewController.swift
//  IBTest
//
//  Created by ohhyeongseok on 2022/01/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var uiTitle01: UILabel!

    @IBAction func clickBtn01(_ sender: Any) {
        self.uiTitle01.text = "Button01 Clicked"
    }
    
    
    @IBOutlet var uiTitle02: UILabel!
    
    
    @IBAction func clickBtn02(_ sender: Any) {
        self.uiTitle01.text = "Button02 Clicked"
    }
    
    @IBOutlet var uiTitle03: UILabel!
    
    @IBAction func clickBtn03(_ sender: Any) {
        self.uiTitle01.text = "Button03 Clicked"
    }
    
    
    
    @IBOutlet var uiTitle04: UILabel!
    
    @IBAction func clickBtn04(_ sender: Any) {
        self.uiTitle01.text = "Button04 Clicked"
    }
    
    
    @IBOutlet var uiTitle05: UILabel!
    
    @IBAction func clickBtn05(_ sender: Any) {
        self.uiTitle01.text = "Button05 Clicked"
    }
    
}

