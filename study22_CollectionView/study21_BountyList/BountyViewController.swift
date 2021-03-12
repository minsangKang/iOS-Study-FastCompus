//
//  BountyViewController.swift
//  study21_BountyList
//
//  Created by Kang Minsang on 2021/02/21.
//

import UIKit

class BountyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MVVM
    
    //Model
    //- BountyInfo
    //> BountyInfo 만들자
    
    //View
    //- ListCell
    //> ListCell 필요한 정보를 ViewModel 한테서 받아야겠다
    //> ListCell은 ViewModel로 부터 받은 정보로 뷰 업데이트 하기
    
    //ViewModel
    //- BountyViewModel
    //> BountyViewModel를 만들고, 뷰레이어에서 필요한 메서드 만들기
    //> 모델 가지고 있기,, BountyInfo 들
    
    let viewModel = BountyViewModel()
    
    //세그웨이를 실행하기 직전에 실행되는 코드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
    }
    
    //UICollectionViewDataSource
    //몇개를 보여줄까요?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    
    //어떻게 표현할까요?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.item)
        cell.update(info: bountyInfo)
        return cell
    }
    
    //UICollectionViewDelegate
    //셀이 클릭되었을 때 어떻게 할까요?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("--> \(indexPath.item)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    //UICollectionViewFlowLayout
    //cell 사이즈를 계산할거다 (목표 : 다양한 디바이스에서 일관적인 디자인을 보여주기 위해)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 65
        
        let width: CGFloat = (collectionView.bounds.width - itemSpacing)/2
        let height: CGFloat = width * 10/7 + textAreaHeight
        return CGSize(width: width, height: height)
    }
}




//custom cell 생성
class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}




//viewModel 생성
class BountyViewModel {
    //Model 생성
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 440000),
        BountyInfo(name: "luffy", bounty: 3000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000),
    ]
    
    var sortedList: [BountyInfo] {
        let sortedList = bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    var numOfBountyInfoList: Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedList[index]
    }
}
