//
//  BountyInfo.swift
//  study21_BountyList
//
//  Created by Kang Minsang on 2021/02/26.
//

import UIKit

//Model - BountyInfo 생성
struct BountyInfo {
    let name: String
    let bounty: Int
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
