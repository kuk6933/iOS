//
//  BountyViewController.swift
//  BountyList
//
//  Created by ohhyeongseok on 2022/11/14.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let viewModel = BountyViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 데이터 줄거에요
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = viewModel.bountyInfo(at: index)
                vc?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfBountyInfoList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        cell.update(info: bountyInfo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info : BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}

class BountyViewModel {
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    var sortedList: [BountyInfo] {
        let sortedList = bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    var numberOfBountyInfoList: Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedList[index]
    }
}
