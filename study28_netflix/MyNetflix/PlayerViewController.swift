//
//  PlayerViewController.swift
//  MyNetflix
//
//  Created by joonwon lee on 2020/04/01.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet weak var controlView: UIView!
    @IBOutlet weak var playButton: UIButton!
    
    let player = AVPlayer()
    
    //화면방향 설정
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func togglePlaybutton(_ sender: Any) {
        playButton.isSelected = !playButton.isSelected
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}
//현재 진행중인지 여부 메소드 생성
extension AVPlayer {
    var isPlaying: Bool {
        guard self.currentItem != nil else { return false }
        return self.rate != 0
    }
}
