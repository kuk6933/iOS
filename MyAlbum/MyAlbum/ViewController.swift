//
//  ViewController.swift
//  MyAlbum
//
//  Created by ohhyeongseok on 2022/11/07.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    
    @IBOutlet var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }
  
    @IBAction func hello(_ sender: Any) {
        let message = "가격은 \(currentValue)입니다"
        let alert = UIAlertController(title: "Heelo",                                      message: message, preferredStyle: .alert)
        let action = UIAlertAction(title:"OK", style: .default, handler: { action in
            self.refresh()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func refresh() {
        let randomPrice = arc4random_uniform(10000) + 1
        currentValue = Int(randomPrice)
        priceLabel.text = "\(currentValue)"
    }
}

