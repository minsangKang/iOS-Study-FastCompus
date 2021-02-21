//
//  BountyViewController.swift
//  study21_BountyList
//
//  Created by Kang Minsang on 2021/02/21.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //필수1. - 테이블뷰 셀이 몇개? -> UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //개수를 반환한다
        return 5
    }
    //필수2. - 테이블뷰 어떻게 보여주나? -> UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //보여줄 cell를 설정 후 반환한다
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    //추가 - 테이블뷰 클릭하면 어떻게하나? -> UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
    }
}
