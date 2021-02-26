//
//  BountyViewController.swift
//  study21_BountyList
//
//  Created by Kang Minsang on 2021/02/21.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
    
    //필수1. - 테이블뷰 셀이 몇개? -> UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //개수를 반환한다
        return viewModel.numOfBountyInfoList
    }
    //필수2. - 테이블뷰 어떻게 보여주나? -> UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //보여줄 cell를 설정 후 반환한다
        //optional을 사용해서 ListCell을 넘기도록 한다
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        
        cell.update(info: bountyInfo)
        return cell
    }
    //추가 - 테이블뷰 클릭하면 어떻게하나? -> UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        //세그웨이를 실행해서 두번째 화면으로 넘긴다
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

//custom cell 생성
class ListCell: UITableViewCell {
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
