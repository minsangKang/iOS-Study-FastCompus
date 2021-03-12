//
//  TrackManager.swift
//  AppleMusicStApp
//
//  Created by joonwon lee on 2020/01/12.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit
import AVFoundation

class TrackManager {
    // TODO: 프로퍼티 정의하기 - 트랙들, 앨범들, 오늘의 곡
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    var todaysTrack: AVPlayerItem?
    
    // TODO: 생성자 정의하기
    init() {
        self.tracks = loadTracks()
        self.albums = loadAlbums(tracks: tracks)
        self.todaysTrack = self.tracks.randomElement()
    }

    // TODO: 트랙 로드하기
    func loadTracks() -> [AVPlayerItem] {
        //파일들 읽어서 AVPlayerItem 만들기
        //앱 : Bundle이므로, Bundle 안의 mp3 파일을 찾는식
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        //방법 1
//        var items: [AVPlayerItem] = []
//
//        for url in urls {
//            let item = AVPlayerItem(url: url)
//            items.append(item)
//        }
        
        //방법 2
//        let items = urls.map { url -> AVPlayerItem in
//            let item = AVPlayerItem(url: url)
//            return item
//        }
        
        //방법 3
        let items = urls.map { url in
            AVPlayerItem(url: url)
        }
        
        //방법 4
//        let items = urls.map { AVPlayerItem(url: $0) }
        
        
        return items
    }
    
    // TODO: 인덱스에 맞는 트랙 로드하기
    func track(at index: Int) -> Track? {
        let playerItem = tracks[index]
        //AVPlayerItem -> Track으로 변환이 필요하다
        let track = playerItem.convertToTrack()
        return track
    }

    // TODO: 앨범 로딩메소드 구현
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        //AVPlayerItem -> Track으로 변환하여 배열에 추가
        let trackList: [Track] = tracks.compactMap { $0.convertToTrack() }
        //key : track.albumName, value : trackList 에서 key 값에 해당하는 값들
        let albumDics = Dictionary(grouping: trackList, by: { (track) in track.albumName })
        var albums: [Album] = []
        
        for (key, value) in albumDics {
            let title = key
            let tracks = value
            let album = Album(title: title, tracks: tracks)
            albums.append(album)
        }
        return albums
    }

    // TODO: 오늘의 트랙 랜덤으로 선책
    func loadOtherTodaysTrack() {
        self.todaysTrack = self.tracks.randomElement()
    }
}
