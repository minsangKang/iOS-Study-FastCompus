//
//  ViewController.swift
//  study1_album
//
//  Created by Kang Minsang on 2021/02/07.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    
    @IBOutlet var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }

    @IBAction func hello(_ sender: Any) {
        
        let message = "가격은 ₩\(currentValue) 입니다"
        let alert = UIAlertController(title: "Hello", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        refresh()
    }
    
    func refresh() {
        //랜덤숫자 생성 기능
        let randomPrice = arc4random_uniform(10000) + 1
        currentValue = Int(randomPrice)
        //string interpolation 기능
        priceLabel.text = "₩\(currentValue)"
    }
}

