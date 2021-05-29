//
//  HistoryViewController.swift
//  MyNetflix
//
//  Created by Kang Minsang on 2021/05/30.
//  Copyright © 2021 com.joonwon. All rights reserved.
//

import UIKit
import Firebase

class HistoryViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let db = Database.database().reference().child("searchHistory")
    var searchTerms: [SearchTerm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        db.observeSingleEvent(of: .value) { (snapshot) in
            guard let searchHistory = snapshot.value as? [String: Any] else { return }
            let datas = Array(searchHistory.values)
            let data = try! JSONSerialization.data(withJSONObject: Array(searchHistory.values), options: [])
            
            let decoder = JSONDecoder()
            let searchTerms = try! decoder.decode([SearchTerm].self, from: data)
            //정렬
            self.searchTerms = searchTerms.sorted { $0.timestamp > $1.timestamp }
            self.tableView.reloadData()
//            print("---> snapshot: \(searchTerms)")
        }
    }
}

extension HistoryViewController: UITableViewDataSource {
    //개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchTerms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as? HistoryCell else { return UITableViewCell()
        }
        cell.searchTerm.text = searchTerms[indexPath.row].term
        return cell
    }
}

class HistoryCell: UITableViewCell {
    @IBOutlet weak var searchTerm: UILabel!
}

struct SearchTerm: Codable {
    let term: String
    let timestamp: TimeInterval
}
