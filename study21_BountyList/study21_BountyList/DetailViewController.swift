//
//  DetailViewController.swift
//  study21_BountyList
//
//  Created by Kang Minsang on 2021/02/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MVVM
    
    //Model
    //- BountyInfo
    //> BountyInfo 만들자
    
    //View
    //- imgView, nameLabel, bountyLabel
    //> view들은 viewModel를 통해서 구성되기
    
    //ViewModel
    //- DetailViewModel
    //> 뷰 레이어에서 필요한 메서드 만들기
    //> 모델 가지고 있기,, BountyInfo 들
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!

//    var name: String?
//    var bounty: Int?
    
    var bountyInfo: BountyInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        
        if let bountyInfo = self.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
