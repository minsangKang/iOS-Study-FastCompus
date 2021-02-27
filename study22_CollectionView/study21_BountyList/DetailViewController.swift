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

    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    let viewModel = DetailViewModel()
    //view가 보여기지 전
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    //view가 보여진 후
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //animation 추가
        showAnimation()
    }
    
    func updateUI() {
        
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
    
    private func prepareAnimation() {
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0)
            .scaledBy(x: 3, y: 3).rotated(by: 180)
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0)
            .scaledBy(x: 3, y: 3).rotated(by: 180)
        
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
    }
    
    private func showAnimation() {
        nameLabelCenterX.constant = 0
        bountyLabelCenterX.constant = 0

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.nameLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.bountyLabel.transform = CGAffineTransform.identity
            self.bountyLabel.alpha = 1
        }, completion: nil)
        
        UIView.transition(with: imgView, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
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
