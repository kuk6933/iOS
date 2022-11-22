//
//  DetailViewController.swift
//  BountyList
//
//  Created by ohhyeongseok on 2022/11/17.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MVVM
    
    //Model
    //- BountyInfo
    
    // View
    // - ImageView, nameLabel, bountyLabel
    // view들은 viewModel을 통해서 구성되기?
    
    // ViewModel
    // 뷰 레이어에서 필요한 ㅔㅁ서드 만들기
    // 모델 가지고있기

    let viewModel = DetailViewModel()
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
