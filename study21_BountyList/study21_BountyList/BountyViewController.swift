//
//  BountyViewController.swift
//  study21_BountyList
//
//  Created by Kang Minsang on 2021/02/21.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //데이터 생성
    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountryList = [33000000, 50, 440000, 3000000, 16000000, 80000000, 77000000, 120000000]
    
    //세그웨이를 실행하기 직전에 실행되는 코드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.bounty = bountryList[index]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //필수1. - 테이블뷰 셀이 몇개? -> UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //개수를 반환한다
        return bountryList.count
    }
    //필수2. - 테이블뷰 어떻게 보여주나? -> UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //보여줄 cell를 설정 후 반환한다
        //optional을 사용해서 ListCell을 넘기도록 한다
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let img = UIImage(named: "\(nameList[indexPath.row])")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountryList[indexPath.row])"
        
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
}
