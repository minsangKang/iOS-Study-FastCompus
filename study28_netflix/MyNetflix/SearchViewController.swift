//
//  SearchViewController.swift
//  MyNetflix
//
//  Created by joonwon lee on 2020/04/02.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        SearchAPI.search(searchTerm) { movies in
            //CollectionView 로 표현해주자
        }
        
        print("--> 검색어: \(searchTerm)")
    }
}


//검색API 제작
class SearchAPI {
    //@escaping : completion handler : closure가 method 밖에서 실행될 수 있게 설정
    //static method의 이유 : SearchAPI.search() 처럼 바로 사용이 가능하기 때문
    static func search(_ term: String, completion: @escaping ([Movie]) -> Void) {
        let session = URLSession(configuration: .default)
        let requestURL = getURL(term: term)
        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300
            guard error == nil,
                let statusCode = (response as? HTTPURLResponse)?.statusCode,
                successRange.contains(statusCode) else {
                completion([])
                return
            }
            guard let resultData = data else {
                completion([])
                return
            }
            //data -> [Movie]
            let string = String(data: resultData, encoding: .utf8)
            print("--> string: \(string)")
        }
        dataTask.resume()
    }
    
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
}

//결과를 받아올 모델
struct Response {
    
}

struct Movie {
    
}
