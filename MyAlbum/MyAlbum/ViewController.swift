//
//  ViewController.swift
//  MyAlbum
//
//  Created by ohhyeongseok on 2022/11/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func hello(_ sender: Any) {
        let alert = UIAlertController(title: "Heelo",
                                      message: "My First App!!", preferredStyle: .alert)
        let action = UIAlertAction(title:"OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

