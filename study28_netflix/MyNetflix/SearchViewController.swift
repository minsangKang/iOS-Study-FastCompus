//
//  SearchViewController.swift
//  MyNetflix
//
//  Created by joonwon lee on 2020/04/02.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit
import AVFoundation
import Kingfisher

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    //viewController
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
//내용 설정
extension SearchViewController: UICollectionViewDataSource {
    //개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    //표현 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //화면에 들어갈 cell를 ResultCell 형식으로 준비
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
            return UICollectionViewCell()
        }
        //cell의 이미지를 movies 데이터를 이용해 수정
        let movie = movies[indexPath.item]
        let url = URL(string: movie.thumbnailPath)!
        //string -> image 변환작업 : 외부코드 가져다 쓰는 방법으로 사용
        cell.movieThumbnail.kf.setImage(with: url)
        return cell
    }
}
//터치 설정
extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.item]
        //movie -> player 전달할 item 생성
        let url = URL(string: movie.previewURL)!
        let item = AVPlayerItem(url: url)
        //player 전달 준비
        let sb = UIStoryboard(name: "Player", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PlayerViewController") as! PlayerViewController
        vc.modalPresentationStyle = .fullScreen
        //item -> player 전달
        vc.player.replaceCurrentItem(with: item)
        //player 실행
        present(vc, animated: false, completion: nil)
    }
}
//크기 설정
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 8
        let itemSpacing: CGFloat = 10
        let width: CGFloat = (collectionView.bounds.width - (margin*2) - (itemSpacing*2)) / 3
        let height: CGFloat = width * 10/7
        return CGSize(width: width, height: height)
    }
}

extension SearchViewController: UISearchBarDelegate {
    //키보드 내리기 함수
    private func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    //입력 후 search 누를 경우
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //키보드가 올라와 있을때, 내려가게 처리
        dismissKeyboard()
        //검색어가 있는지 확인
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false else { return }
        //네트워킹을 통한 검색
        //- 서치텀을 가지고 네트워킹을 통해서 영화 검색
        //- 검색API 필요 : OK
        //- 결과를 받아올 모델 Movie, Response 필요 : OK
        //- 결과를 받아와서 CollectionView 로 표현해주자
        
        // search 함수에서 url -> decode -> [Movie]를 넘겨받아온 후의 closure
        SearchAPI.search(searchTerm) { movies in
            //CollectionView 로 표현해주자 : OK
            //가져온 movies로 데이터를 수정
            self.movies = movies
            //화면을 재수정하기 위해서 main 쓰레드에서 동작
            DispatchQueue.main.async {
                self.resultCollectionView.reloadData()
            }
            
        }
        
        print("--> 검색어: \(searchTerm)")
    }
}


//검색API 제작
class SearchAPI {
    //@escaping : completion handler : closure가 method 밖에서 실행될 수 있게 설정
    //static method의 이유 : SearchAPI.search() 처럼 바로 사용이 가능하기 때문
    static func search(_ term: String, completion: @escaping ([Movie]) -> Void) {
        //session, url 준비
        let session = URLSession(configuration: .default)
        let requestURL = getURL(term: term)
        //task 실행
        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300
            //error 및 success 숫자 확인
            guard error == nil,
                let statusCode = (response as? HTTPURLResponse)?.statusCode,
                successRange.contains(statusCode) else {
                completion([])
                return
            }
            //resultData로 저장
            guard let resultData = data else {
                completion([])
                return
            }
            //resultData -> [Movie]
            let movies = parseMovies(resultData)
            print("--> movies count: \(movies.count)")
            completion(movies)
        }
        dataTask.resume()
    }
    //url components 구성
    static func getURL(term: String) -> URL {
        var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
        let mediaQuery = URLQueryItem(name: "media", value: "movie")
        let entityQuery = URLQueryItem(name: "entity", value: "movie")
        let termQuery = URLQueryItem(name: "term", value: term)
        urlComponents.queryItems?.append(mediaQuery)
        urlComponents.queryItems?.append(entityQuery)
        urlComponents.queryItems?.append(termQuery)

        return urlComponents.url!
    }
    //resultData -> decode -> [Movies]
    static func parseMovies(_ data: Data) -> [Movie] {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(Response.self, from: data)
            let movies = response.movies
            return movies
        } catch let error {
            print(error.localizedDescription)
            return[]
        }
    }
}

//결과를 받아올 모델
struct Response: Codable {
    let resultCount: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case movies = "results"
    }
}

struct Movie: Codable {
    let title: String
    let director: String
    let thumbnailPath: String
    let previewURL: String
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case director = "artistName"
        case thumbnailPath = "artworkUrl100"
        case previewURL = "previewUrl"
    }
}



class ResultCell: UICollectionViewCell {
    @IBOutlet weak var movieThumbnail: UIImageView!
}
